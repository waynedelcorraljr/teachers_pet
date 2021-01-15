class Student < ApplicationRecord
    has_many :courses
    has_many :users, through: :courses
    has_many :lessons, through: :courses
end
