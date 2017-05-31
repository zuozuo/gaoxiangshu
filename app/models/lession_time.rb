class LessionTime < ApplicationRecord
  belongs_to :course_student
  belongs_to :teacher

  WeekDays = [
    ["周一", 1],
    ["周二", 2],
    ["周三", 3],
    ["周四", 4],
    ["周五", 5],
    ["周六", 6],
    ["周日", 7]
  ]
end
