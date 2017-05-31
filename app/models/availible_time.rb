class AvailibleTime < ApplicationRecord
  belongs_to :teacher
  validates :teacher_id, :day, :start_at, :end_at, presence: true
  WeekDays = {
    Monday: 1,
    Tuesday: 2,
    Wednesday: 3,
    Thursday: 4,
    Friday: 5,
    Saturday: 6,
    Sunday: 7
  }
end
