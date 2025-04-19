class AddNameToGuidedTracings < ActiveRecord::Migration[8.0]
  def change
    add_column :guided_tracings, :name, :string
  end
end
