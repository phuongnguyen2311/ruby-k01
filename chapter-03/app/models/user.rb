class User < ApplicationRecord
  has_secure_password
  has_many :microposts, dependent: :destroy
  has_many :comments,  dependent: :destroy
  has_one_attached :avatar
  attr_accessor :remember_token, :activation_token, :reset_token, :api_token
  before_save :downcase_email
  before_create :create_activation_digest

  VALID_EMAIL_REGEX = URI::MailTo::EMAIL_REGEXP
  validates :email, presence: true, uniqueness: true, length: {maximum: 50},
  format: {with: VALID_EMAIL_REGEX,   message: :invalid } 
  

  validates :name, presence: true,length: { minimum: 2,maximum: 60, message: :max_character}

  validates :gender, :inclusion => { :in => %w(male female orther), :allow_blank => true}
 
  
  PASSWORD_FORMAT = /\A(?=.{8,})(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[[:^alnum:]])/x
  validates :password, format: {with: PASSWORD_FORMAT, message: :invalid_password},
  if: -> { password.present? }
  validates_presence_of :password_confirmation, if: -> { password.present? }
  validates_confirmation_of :password, if: -> { password.present? }

  def User.digest(string)
    cost =  if ActiveModel::SecurePassword.min_cost
              BCrypt::Engine::MIN_COST
            else
              BCrypt::Engine.cost
            end
    BCrypt::Password.create string, cost: cost
  end

  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = User.new_token
    update_attribute :remember_digest, User.digest(remember_token)
  end
  
  def generate_token
    self.api_token = User.new_token
    self.update_attribute(:api_token_digest, api_token)
  end
  def forget
    update_attribute :remember_digest, nil
  end

  def authenticated? attribute, token
    digest = send "#{attribute}_digest"
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password? token
  end

  def activate
    update_columns activated: true, activated_at: Time.zone.now
  end

  def send_activation_email
    UserMailer.account_activation(self).deliver_now
  end

  def create_reset_digest
    self.reset_token = User.new_token
    update_columns reset_digest: User.digest(reset_token), reset_sent_at: Time.zone.now
  end

  def send_password_reset_email
    UserMailer.password_reset(self).deliver_now
  end
  
  def password_reset_expired?
    reset_sent_at < 2.hours.ago
  end
  
  def feed
    microposts
  end

  


  private
# Converts email to all lower-case.
  def downcase_email
    self.email.downcase!
  end
  
  def to_lower
    self.name = self.name.downcase
   end
# Creates and assigns the activation token and digest.
  def create_activation_digest
    self.activation_token = User.new_token
    self.activation_digest = User.digest(activation_token)
  end

end
