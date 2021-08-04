class User < ApplicationRecord
  has_secure_password
  has_many :microposts
  before_save :to_lower
  attr_accessor :remember_token

  VALID_EMAIL_REGEX = URI::MailTo::EMAIL_REGEXP
  validates :email, presence: true, uniqueness: true, length: {maximum: 50},
  format: {with: VALID_EMAIL_REGEX,   message: "email erro" } 
  validates_presence_of :email, message: "khong dc de trong"

  validates :name, presence: true,length: { minimum: 2,maximum: 60, message: "ten tu 2 den 60 ki tu"}
  validates_presence_of :name, message: "khong dc de trong"

  validates :gender, :inclusion => { :in => %w(male female orther), :allow_blank => true}
  validates_presence_of :gender, message: "khong dc de trong"
  
  validates_presence_of :password_confirmation, if: -> { password.present? }
  validates_confirmation_of :password, if: -> { password.present? }
  def to_lower
   self.name = self.name.downcase
  end

  def User.digest(string)
    cost =  if ActiveModel::SecurePassword.min_cost
              BCrypt::Engine::MIN_COST
            else
              BCrypt::Engine.cost
            end
    BCrypt::Password.create string, cost: cost
  end

  class << self
    def new_token
    SecureRandom.urlsafe_base64
    end
  end

  def remember
    self.remember_token = User.new_token
    update_attribute :remember_digest, User.digest(remember_token)
  end

  def authenticated? remember_token
    BCrypt::Password.new(remember_digest).is_password? remember_token
  end

  def forget
    update_attribute :remember_digest, nil
  end
  
end
