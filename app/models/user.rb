class User < ApplicationRecord
  has_many :feedbacks, dependent: :destroy

  has_many :user_achievements, dependent: :destroy
  has_many :achievements, through: :user_achievements

  has_many :purchased_avatars, dependent: :destroy
  has_many :avatar_borders, through: :purchased_avatars

  has_secure_password
  validates :username, presence: true, uniqueness: true
  # validate :dob_cannot_be_in_future
  enum :gender, {
    Male: 0,
    Female: 1
  }

  ADMIN_ROLE_ID = 0
  USER_ROLE_ID = 1

  def admin?
    role_id == ADMIN_ROLE_ID
  end

  def dob_cannot_be_in_future
    if dob.present? && dob > Date.today
      errors.add(:dob, "Can't be in future")
    end
  end
end
