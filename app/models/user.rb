class User < ApplicationRecord
    has_secure_password
    has_many :courses
    has_many :students, through: :courses
    has_many :lessons, through: :courses

    
end
