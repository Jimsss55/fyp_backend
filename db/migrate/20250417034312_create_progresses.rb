class CreateProgresses < ActiveRecord::Migration[8.0]
  def change
    create_table :progresses do |t|
      t.references :user, null: false, foreign_key: true
      t.references :progressable, polymorphic: true, null: false
      t.timestamps
    end

    add_index :progresses, [ :user_id, :progressable_id, :progressable_type ], unique: true
  end
end
