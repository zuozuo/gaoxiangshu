class News < ApplicationRecord
  has_attached_file :image, default_url: "user.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
