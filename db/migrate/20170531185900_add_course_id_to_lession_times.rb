class AddCourseIdToLessionTimes < ActiveRecord::Migration[5.0]
  def change
    add_column :lession_times, :course_id, :integer
    add_index :lession_times, :course_id
  end
end
