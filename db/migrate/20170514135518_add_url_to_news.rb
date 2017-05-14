class AddUrlToNews < ActiveRecord::Migration[5.0]
  def change
    add_column :news, :url, :string
  end
end
