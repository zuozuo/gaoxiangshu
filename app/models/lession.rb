class Lession < ApplicationRecord
  belongs_to :student
  belongs_to :teacher
  belongs_to :course

  scope :uncompleted, -> { where("end_at > '#{Time.now}' ") }
  scope :completed, -> { where("end_at <= '#{Time.now}'") }
end
