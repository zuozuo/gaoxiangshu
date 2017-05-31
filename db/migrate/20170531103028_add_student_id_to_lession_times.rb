class AddStudentIdToLessionTimes < ActiveRecord::Migration[5.0]
  def change
    add_column :lession_times, :student_id, :integer
    add_index :lession_times, :student_id
  end
end
