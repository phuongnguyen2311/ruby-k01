class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable , omniauth_providers: [:facebook]

  def self.from_omniauth(auth)
  result = User.where(email: auth.info.email).first
  if result
    return result
  else
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      
      user.uid = auth.uid
      user.provider = auth.provider
      
    end
  end
end
end
