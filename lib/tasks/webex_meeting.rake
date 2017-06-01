namespace :webex_meeting do
  desc "create webex meetings"    

  task create: [:environment] do
    Lession.tomorrow.each do |l|
      l.create_webex_meeting
    end
  end
end
