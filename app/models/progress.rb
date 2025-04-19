class Progress < ApplicationRecord
  belongs_to :user
  belongs_to :progressable, polymorphic: true

  validates :user_id, uniqueness: { scope: [:progressable_type, :progressable_id],
                                    message: "Can only have one progress per tracing"}
end
