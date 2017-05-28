class CreateCourseTeachers < ActiveRecord::Migration[5.0]
  def change
    create_table :course_teachers do |t|
      t.integer :course_id
      t.integer :teacher_id

      t.timestamps
    end
    add_index :course_teachers, :course_id
    add_index :course_teachers, :teacher_id
  end
end
