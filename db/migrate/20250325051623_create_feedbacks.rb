class CreateFeedbacks < ActiveRecord::Migration[8.0]
  def change
    create_table :feedbacks do |t|
      t.references :user, foreign_key: true, null: false
      t.text :message, null: false
      t.integer :status, default: 0, null: false
      t.timestamps
    end
  end
end
