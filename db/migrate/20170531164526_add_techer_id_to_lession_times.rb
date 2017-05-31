class AddTecherIdToLessionTimes < ActiveRecord::Migration[5.0]
  def change
    add_column :lession_times, :teacher_id, :integer
    add_index :lession_times, :teacher_id
  end
end
