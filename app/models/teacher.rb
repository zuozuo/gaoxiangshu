class Teacher < User
  has_many :lessions
  has_many :students, through: :course_students
  has_many :course_teachers
  has_many :course_students
  has_many :lession_times
  has_many :courses, through: :course_teachers
  has_many :availible_times
end
