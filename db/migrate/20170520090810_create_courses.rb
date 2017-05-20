class CreateCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :courses do |t|
      t.datetime :date
      t.integer :length
      t.integer :status
      t.integer :student_id
      t.integer :teacher_id

      t.timestamps
    end
    add_index :courses, :teacher_id
    add_index :courses, :student_id
  end
end
