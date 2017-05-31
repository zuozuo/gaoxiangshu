class CreateAvailibleTimes < ActiveRecord::Migration[5.0]
  def change
    create_table :availible_times do |t|
      t.integer :day
      t.integer :teacher_id
      t.time :start_at
      t.time :end_at

      t.timestamps
    end
    add_index :availible_times, :teacher_id
  end
end
