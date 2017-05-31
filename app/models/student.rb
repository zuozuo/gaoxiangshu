class Student < User
  has_many :lessions
  has_many :lession_times
  has_many :teachers, through: :course_students
  has_many :course_students
  has_many :courses, through: :course_students
end
