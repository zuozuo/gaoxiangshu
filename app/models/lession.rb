class Lession < ApplicationRecord
  belongs_to :student
  belongs_to :teacher
  belongs_to :course
  belongs_to :customer_service

  scope :uncompleted, -> { where("end_at > '#{Time.now}' ") }
  scope :completed, -> { where("end_at <= '#{Time.now}'") }
  scope :tomorrow, -> { where("start_at between '#{Date.tomorrow.beginning_of_day}' and '#{Date.tomorrow.end_of_day}'") }
  scope :in_a_week, -> { where("start_at between '#{Date.tomorrow.beginning_of_day}' and '#{(Date.today+7.days).end_of_day}'") }
  scope :upcomming, -> { where("start_at > '#{Time.now}' and end_at < '#{Date.tomorrow.end_of_day}' ") }

  def create_webex_meeting
    credential = Settings.webex.to_hash
    sm = WebexXmlApi::Meeting::CreateMeeting.new(credential)
    sm.conf_name = "#{course.name} meeting room for #{student.name} and #{teacher.name} "
    sm.start_date = start_at.strftime("%m/%d/%Y %H:%M:%S")
    sm.meeting_password = SecureRandom::hex 4
    sm.duration = '30'
    sm.open_time = '900'
    res = sm.send_request
    if res['meetingkey'].present?
      update!(
        meetingkey: res['meetingkey'],
        meeting_password: sm.meeting_password
      )
      credential[:session_key] = self.meetingkey
    end
    host_meeting = WebexXmlApi::Meeting::GethosturlMeeting.new(credential)
    res = host_meeting.send_request
    self.host_url = res["hostMeetingURL"]
    join_meeting = WebexXmlApi::Meeting::GetjoinurlMeeting.new(credential)
    res = join_meeting.send_request
    self.join_url = res["joinMeetingURL"]
    self.save!
  end
end
