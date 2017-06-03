class AddInitPasswordToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :init_password, :string
  end
end
