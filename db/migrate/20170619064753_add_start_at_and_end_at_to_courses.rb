class AddStartAtAndEndAtToCourses < ActiveRecord::Migration[5.0]
  def change
    add_column :courses, :start_at, :date
    add_column :courses, :end_at, :date
  end
end
