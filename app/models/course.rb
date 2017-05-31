class Course < ApplicationRecord
  has_many :lessions
  has_many :course_teachers
  has_many :course_students
  has_many :teachers, through: :course_teachers
  has_many :students, through: :course_students

  def teachers=(teachers)
  end
end
