class AddCurstomerServiceIdToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :customer_service_id, :integer
    add_index :users, :customer_service_id
  end
end
