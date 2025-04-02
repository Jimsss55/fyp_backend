class AddStarCountToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :starCount, :integer, default: 0
  end
end
