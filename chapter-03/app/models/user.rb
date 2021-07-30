class User < ApplicationRecord
  has_secure_password
  has_many :microposts
  before_save :to_lower

  VALID_EMAIL_REGEX = URI::MailTo::EMAIL_REGEXP
  validates :email, presence: true, uniqueness: true, length: {maximum: 50},
  format: {with: VALID_EMAIL_REGEX,   message: "email erro" } 
  validates_presence_of :email, message: "khong dc de trong"

  validates :name, presence: true,length: { minimum: 2,maximum: 60, message: "ten tu 2 den 60 ki tu"}
  validates_presence_of :name, message: "khong dc de trong"

  validates :gender, :inclusion => { :in => %w(male female orther), :allow_blank => true}
  validates_presence_of :gender, message: "khong dc de trong"
  
  validates :password_confirmation, presence: true
  def to_lower
   self.name = self.name.downcase
  end
  
end
