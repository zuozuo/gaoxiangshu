class AddCustomerServiceIdToLessions < ActiveRecord::Migration[5.0]
  def change
    add_column :lessions, :customer_service_id, :integer
    add_index :lessions, :customer_service_id
  end
end
