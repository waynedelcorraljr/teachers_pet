class Course < ApplicationRecord
    belongs_to :student
    belongs_to :user
    has_many :lessons
end
