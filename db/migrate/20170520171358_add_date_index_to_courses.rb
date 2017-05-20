class AddDateIndexToCourses < ActiveRecord::Migration[5.0]
  def change
    add_index :courses, :date
  end
end
