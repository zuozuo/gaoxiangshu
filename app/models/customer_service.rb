class CustomerService < User
  has_many :students
  has_many :lessions
end
