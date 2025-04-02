class CreatePurchasedAvatars < ActiveRecord::Migration[8.0]
  def change
    create_table :purchased_avatars do |t|
      t.references :user, null: false, foreign_key: true
      t.bigint :avatar_border_id, using: 'avatar_border::bigint'
      t.timestamps
    end
  end
end
