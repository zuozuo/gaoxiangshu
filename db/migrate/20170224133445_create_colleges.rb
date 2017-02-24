class CreateColleges < ActiveRecord::Migration[5.0]
  def change
    create_table :colleges do |t|
      t.string :name
      t.text :desc

      t.timestamps
    end
    add_attachment :colleges, :logo
  end
end
