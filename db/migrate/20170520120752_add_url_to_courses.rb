class AddUrlToCourses < ActiveRecord::Migration[5.0]
  def change
    add_column :courses, :url, :string
  end
end
