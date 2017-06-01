class AddMeetingAttrToLessions < ActiveRecord::Migration[5.0]
  def change
    add_column :lessions, :meetingkey, :string
    add_column :lessions, :join_url, :text
    add_column :lessions, :host_url, :text
    add_column :lessions, :meeting_password, :string
  end
end
