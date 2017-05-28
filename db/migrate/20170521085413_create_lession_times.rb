class CreateLessionTimes < ActiveRecord::Migration[5.0]
  def change
    create_table :lession_times do |t|
      t.datetime :time
      t.integer :student_id
      t.integer :teacher_id

      t.timestamps
    end
  end
end
