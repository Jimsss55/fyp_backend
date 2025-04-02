class CreateUserAchievements < ActiveRecord::Migration[8.0]
  def change
    create_table :user_achievements do |t|
      t.references :user, null: false, foreign_key: true
      t.string :achievement_id, null: false
      t.timestamps
    end
  end
end
