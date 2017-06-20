class AddEmailToApplies < ActiveRecord::Migration[5.0]
  def change
    add_column :applies, :email, :string
  end
end
