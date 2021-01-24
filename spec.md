# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (e.g. User/Student has_many Courses) 
- [x] Include at least one belongs_to relationship (e.g. Course belongs_to User/Student)
- [x] Include at least two has_many through relationships (e.g. User has_many Students through Courses, Student has_many Users(Teachers) through Courses, User/Student has_many Lessons through Courses)
- [x] Include at least one many-to-many relationship (e.g. User has_many Students through Courses, Student has_many Users(Teachers) through Courses)
- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (all attributes can be edited.)
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Student, Course, Lesson)
- [x] Include a class level ActiveRecord scope method (e.g. Course.by_student(stundent_id, user_id) URL: /courses/by_student/:student_id/:user_id)
- [x] Include signup 
- [x] Include login 
- [x] Include logout 
- [x] Include third party signup/login (e.g. OmniAuth(Google))
- [x] Include nested resource show or index (URL e.g. courses/1/lessons, courses/1/lessons/1)
- [x] Include nested resource "new" form (URL e.g. courses/1/lessons/new)
- [x] Include form display of validation errors (form URL e.g. ALL FORMS)

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate