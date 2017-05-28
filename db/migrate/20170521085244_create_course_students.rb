class CreateCourseStudents < ActiveRecord::Migration[5.0]
  def change
    create_table :course_students do |t|
      t.integer :course_id
      t.integer :student_id
      t.integer :count
      t.integer :count_per_week

      t.timestamps
    end
    add_index :course_students, :course_id
    add_index :course_students, :student_id
  end
end
