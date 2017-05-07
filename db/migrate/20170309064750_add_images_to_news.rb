class AddImagesToNews < ActiveRecord::Migration[5.0]
  def change
    add_attachment :news, :image
  end
end
