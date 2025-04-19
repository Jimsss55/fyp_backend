class GuidedCategory < ApplicationRecord
  has_many :guided_tracings, dependent: :destroy
end
