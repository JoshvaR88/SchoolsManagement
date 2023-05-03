class School < ApplicationRecord
  has_many :courses, dependent: :destroy
  has_many :batches, through: :courses
  has_many :enrolment_requests, through: :batches
  has_many :students, through: :batches
  has_many :school_admins, dependent: :destroy
  
  validates :name, presence: true
end
