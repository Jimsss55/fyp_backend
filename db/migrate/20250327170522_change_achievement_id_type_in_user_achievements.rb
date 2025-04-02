class ChangeAchievementIdTypeInUserAchievements < ActiveRecord::Migration[8.0]
  def change
    change_column :user_achievements, :achievement_id, :bigint, using: 'achievement_id::bigint'
  end
end
