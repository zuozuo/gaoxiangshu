class AddTeacherIdToCourseStudents < ActiveRecord::Migration[5.0]
  def change
    add_column :course_students, :teacher_id, :integer
    add_index :course_students, :teacher_id
  end
end
