class Feedback < ApplicationRecord
  belongs_to :user

  validates :message, presence: true
  enum :status, {
    pending: 0,
    viewed: 1
  }
end
