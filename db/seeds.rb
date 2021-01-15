# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

students = Student.create([{name: "Wizard", grade: "666"}, {name: "Morty", grade: "10"}])

teacher = User.create(username: 'teacher', password: 'test')

wizardry = Course.create(name: 'wizardry', description: 'fake description', user_id: 1, student_id: 1)

Lesson.create(title: 'wand etiquette', plan: 'be nice', course_id: 1)