class Course < ApplicationRecord
  has_many :lessions
  has_many :course_teachers, dependent: :destroy
  has_many :course_students, dependent: :destroy
  has_many :teachers, through: :course_teachers
  has_many :students, through: :course_students

  def teachers=(teachers)
  end
end
