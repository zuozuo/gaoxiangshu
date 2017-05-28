class Student < User
  has_many :lessions
  has_many :courses, through: :lessions
end
