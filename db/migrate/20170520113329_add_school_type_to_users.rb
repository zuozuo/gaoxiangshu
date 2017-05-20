class AddSchoolTypeToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :school_type, :string
  end
end
