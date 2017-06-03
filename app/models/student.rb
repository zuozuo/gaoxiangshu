class Student < User
  has_many :lessions
  has_many :lession_times
  has_many :teachers, through: :course_students
  has_many :course_students
  has_many :courses, through: :course_students
  belongs_to :customer_service

  validates :name, :email, :phone, :school, :grade, presence: true

  scope :bought, -> { where(status: 1) }
  scope :unbought, -> { where(status: 0) }
end
