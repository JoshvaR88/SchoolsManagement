class User < ApplicationRecord
  has_secure_password
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum type: { admin: 'Admin', school_admin: 'SchoolAdmin', student: 'Student' }

  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates :type, presence: true

  belongs_to :school, optional: true
  belongs_to :batch, optional: true
  has_many :enrolment_requests, through: :student

  # has_many :enrolment_requests, foreign_key: :student_id

end
