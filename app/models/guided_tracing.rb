class GuidedTracing < ApplicationRecord
  belongs_to :guided_category
  has_many :progresses, as: :progressable, dependent: :destroy
end
