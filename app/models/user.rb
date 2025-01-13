class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,:omniauthable, omniauth_providers: [:google_oauth2, :github]

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
        
        def self.from_omniauth(auth)
          # Look for a user by GitHub UID
          user = User.where(provider: auth.provider, uid: auth.uid).first
      
          unless user
            user = User.create(
              provider: auth.provider,
              uid: auth.uid,
              name: auth.info.name,
              email: auth.info.email,
              password: Devise.friendly_token[0, 20] # Set a random password
            )
          end
          user
        end
        
end
