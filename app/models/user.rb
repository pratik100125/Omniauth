class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,:omniauthable, omniauth_providers: [:google_oauth2]

         def self.from_omniauth(auth)
          user = User.where(email: auth.info.email).first
        
          unless user
            user = User.create(
              email: auth.info.email,
              password: Devise.friendly_token[0, 20],
              provider: auth.provider,
              uid: auth.uid
            )
          end
        
          user
        end
        
        
end
