class Lession < ApplicationRecord
  belongs_to :student
  belongs_to :teacher
  belongs_to :course

  scope :uncompleted, -> { where('status' => 0) }
  scope :completed, -> { where('status' => 1) }
end
