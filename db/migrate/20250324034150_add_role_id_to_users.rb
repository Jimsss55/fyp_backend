class AddRoleIdToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :role_id, :integer, default: 1, null: false
  end
end
