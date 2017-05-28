class RemoveUnusedColumnsFromCourses < ActiveRecord::Migration[5.0]
  def change
    remove_column :courses, :date
    remove_column :courses, :student_id
    remove_column :courses, :teacher_id
    remove_column :courses, :status
    remove_column :courses, :url
  end
end
