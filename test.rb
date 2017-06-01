sm = WebexXmlApi::Meeting::CreateMeeting.new(site_name: 'talloakacademy', webex_id: 'Lisa6322@sina.com', password: 'P@ss1234')
sm.conf_name = 'Name of the Telephone Conference1'
sm.agenda = 'Meeting Agenda'
sm.start_date = '06/02/2017 15:00:00'
sm.meeting_password = 'zuozuott123'
sm.duration = '30'
sm.open_time = '900'
enable_attendee_list = "zzhattzzh@126.com;zuoyh@funxi.cn"
sm.send_request
