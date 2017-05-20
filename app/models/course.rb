class Course < ApplicationRecord
  belongs_to :student
  belongs_to :teacher

  scope :uncompleted, -> { where('status' => 0) }
  scope :completed, -> { where('status' => 1) }
end
