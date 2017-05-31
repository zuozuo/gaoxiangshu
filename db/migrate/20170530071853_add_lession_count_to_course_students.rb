class AddLessionCountToCourseStudents < ActiveRecord::Migration[5.0]
  def change
    add_column :course_students, :total_lessions, :integer, default: 0
  end
end
