class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  UserType = [
    student: 0,
    parent: 1,
    teacher: 2,
    service: 3,
    admin: 4
  ]

  SchoolTypes = ["私立学校", "公立学校", "公立学校国际部"];

  has_attached_file :avatar,
    styles: { medium: "300x300>", thumb: "100x100>" },
    default_url: "user.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
end
