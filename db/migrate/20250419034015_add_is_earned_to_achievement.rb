class AddIsEarnedToAchievement < ActiveRecord::Migration[8.0]
  def change
    add_column :achievements, :is_Earned, :boolean, default: false
  end
end
