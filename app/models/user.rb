class User < ApplicationRecord
    has_secure_password
    has_many :courses
    has_many :students, through: :courses
    has_many :lessons, through: :courses

    def self.from_omniauth(auth)
        where(username: auth.info.first_name).first_or_initialize do |user|
          user.username = auth.info.first_name
          user.password = SecureRandom.hex
        end
    end
end
