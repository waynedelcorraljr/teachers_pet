class Lesson < ApplicationRecord
    belongs_to :course
    has_many :students, through: :courses
end
