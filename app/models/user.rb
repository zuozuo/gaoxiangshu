class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  UserTypes = [ :student, :parent, :teacher, :customer_service, :admin ]

  def operator?
    UserTypes.index(self.type.underscore.to_sym) >= 3
  end

  UserTypes.each do |type|
    define_method "#{type}?" do
      self.type.underscore == type.to_s
    end
  end

  SchoolTypes = ["私立学校", "公立学校", "公立学校国际部"];

  has_attached_file :avatar,
    styles: { medium: "300x300>", thumb: "100x100>" },
    default_url: "user.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
end
