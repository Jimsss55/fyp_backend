class CreateGuidedTracings < ActiveRecord::Migration[8.0]
  def change
    create_table :guided_tracings do |t|
      t.boolean :completed, default: false
      t.references :guided_category, null: false, foreign_key: true
      t.timestamps
    end
  end
end
