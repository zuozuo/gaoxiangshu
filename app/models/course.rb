class Course < ApplicationRecord
  has_many :lessions
  has_many :course_teachers
  has_many :teachers, through: :course_teachers

  def teachers=(teachers)
  end
end
