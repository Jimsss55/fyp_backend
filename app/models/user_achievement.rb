class UserAchievement < ApplicationRecord
  belongs_to :user
  belongs_to :achievement

  validates :achievement_id, presence: true
end
