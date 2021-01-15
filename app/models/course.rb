class Course < ApplicationRecord
    has_many :students
    has_many :lessons
    belongs_to :user
end
