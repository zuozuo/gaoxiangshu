class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email,              null: false, default: ""
      t.string :phone
      t.integer :age
      t.boolean :gender

      t.timestamps
    end
  end
end
