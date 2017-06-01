class ChangeStartAtInLessions < ActiveRecord::Migration[5.0]
  def change
    add_column :lessions, :end_at, :datetime
    change_column :lessions, :start_at, :datetime
    add_column :lessions, :day, :integer
  end
end
