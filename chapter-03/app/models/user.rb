class User < ApplicationRecord
 before_save :to_lower
 VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
 validates :email, presence: true, uniqueness: true, length: {maximum: 50},
 format: {with: VALID_EMAIL_REGEX,   message: "email erro" }

 validates :name, length: { minimum: 3 }, length: { maximum: 60}

 validates :gender, :presence => true, :inclusion => { :in => %w(male female), :allow_blank => true}

 def to_lower
  self.name = self.name.downcase
 end
end
