class Student < ApplicationRecord
  belongs_to :batch
  has_many :enrolment_requests

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :enrolment_status, inclusion: { in: %w[pending approved denied], message: "%{value} is not a valid enrolment status" }, allow_nil: true
end
