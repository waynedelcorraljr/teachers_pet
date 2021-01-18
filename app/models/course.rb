class Course < ApplicationRecord
    belongs_to :student
    belongs_to :user
    has_many :lessons
    validates :name, :description, presence: true

    def students
        Student.all.select { |s| s.courses.include?(Course.find_by(name: self.name))}
    end
end
