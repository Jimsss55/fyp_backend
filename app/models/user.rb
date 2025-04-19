class User < ApplicationRecord
  has_many :feedbacks, dependent: :destroy

  has_many :user_achievements, dependent: :destroy
  has_many :achievements, through: :user_achievements

  has_many :purchased_avatars, dependent: :destroy
  has_many :avatar_borders, through: :purchased_avatars

  has_many :progresses, dependent: :destroy

  has_secure_password
  validates :username, presence: true, uniqueness: true
  validates :dob, presence: true
  validates :gender, presence: true

  enum :gender, {
    Male: 0,
    Female: 1
  }

  ADMIN_ROLE_ID = 0
  USER_ROLE_ID = 1

  def admin?
    role_id == ADMIN_ROLE_ID
  end
end
