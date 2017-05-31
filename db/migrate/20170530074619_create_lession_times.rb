class CreateLessionTimes < ActiveRecord::Migration[5.0]
  def change
    create_table :lession_times do |t|
      t.integer :course_student_id
      t.string :day
      t.time :start_at
      t.time :end_at

      t.timestamps
    end
    add_index :lession_times, :course_student_id
  end
end
