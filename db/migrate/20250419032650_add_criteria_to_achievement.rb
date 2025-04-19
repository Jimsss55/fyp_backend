class AddCriteriaToAchievement < ActiveRecord::Migration[8.0]
  def change
    add_column :achievements, :criteria, :string
  end
end
