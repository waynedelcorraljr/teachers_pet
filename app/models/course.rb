class Course < ApplicationRecord
    belongs_to :student
    belongs_to :user
    has_many :lessons
    validates :name, :description, presence: true

    def students
        Student.all.select { |s| s.courses.include?(Course.where(name: self.name))}
    end

    def self.by_student(student_id, user_id)
        where(student_id: student_id, user_id: user_id)
    end

    def self.alpha
        self.order(name: :asc)
    end
end
