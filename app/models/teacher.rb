class Teacher < User
  has_many :lessions
  has_many :students, through: :course_students
  has_many :course_teachers
  has_many :course_students
  has_many :lession_times
  has_many :courses, through: :course_teachers
  has_many :availible_times

  def time_zone
    read_attribute(:time_zone) || 'Beijing'
  end

  def time_difference
    time_zone or return 0
    t = "2017-06-01 12:33:28 +0800"
    t = Time.parse(t).in_time_zone("Beijing")
    Rails.logger.info(t)
    t1 = t.in_time_zone(time_zone).strftime("%z").to_i
    Rails.logger.info(t1)
    (t.strftime("%z").to_i - t1)/100
  end
end
