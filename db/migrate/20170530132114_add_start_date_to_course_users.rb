class AddStartDateToCourseUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :course_students, :start_date, :date
  end
end
