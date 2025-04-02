class AvatarBorder < ApplicationRecord
  has_many :purchased_avatars, dependent: :destroy
  has_many :users, through: :purchased_avatars

  validates :name, presence: true
  validates :cost, presence: true
end
