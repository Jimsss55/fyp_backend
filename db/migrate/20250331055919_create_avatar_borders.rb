class CreateAvatarBorders < ActiveRecord::Migration[8.0]
  def change
    create_table :avatar_borders do |t|
      t.string :name, null: false
      t.integer :cost, null: false
      t.timestamps
    end
  end
end
