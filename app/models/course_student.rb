class CourseStudent < ApplicationRecord
  validates :start_date, :total_lessions, :course_id, presence: true
  validates :total_lessions, numericality: { greater_than: 0 }
  validates :course_id, uniqueness: { scope: :student_id }
  
  belongs_to :teacher
  belongs_to :student

  belongs_to :course
  has_many :lession_times

  def ltimes=(ltimes)
  end

  def ltimes
    ActiveSupport::JSON.encode(
      lession_times.map{|lt| [
        lt.day,
        lt.start_at.strftime("%H:%M:%S"),
        lt.end_at.strftime("%H:%M:%S")
      ]}
    )
  end
end
