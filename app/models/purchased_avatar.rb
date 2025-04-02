class PurchasedAvatar < ApplicationRecord
  belongs_to :user
  belongs_to :avatar_border
end
