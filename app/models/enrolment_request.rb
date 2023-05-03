class EnrolmentRequest < ApplicationRecord
  enum status: { pending: 0, approved: 1, denied: 2 }

  belongs_to :student
  belongs_to :batch

  validates :student_id, presence: true
  validates :batch_id, presence: true
end
