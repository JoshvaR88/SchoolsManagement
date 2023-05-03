class Batch < ApplicationRecord
  belongs_to :course
  has_many :enrolment_requests, dependent: :destroy
  has_many :students, dependent: :nullify
  has_many :school_admin_batches, dependent: :destroy
  has_many :school_admins, through: :school_admin_batches

  validates :name, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :start_date_cannot_be_in_the_past
  validate :end_date_cannot_be_before_start_date

  private

  def start_date_cannot_be_in_the_past
    if start_date.present? && start_date < Date.today
      errors.add(:start_date, "can't be in the past")
    end
  end

  def end_date_cannot_be_before_start_date
    if end_date.present? && end_date < start_date
      errors.add(:end_date, "can't be before start date")
    end
  end

end
