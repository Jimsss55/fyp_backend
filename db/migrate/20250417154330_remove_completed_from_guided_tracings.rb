class RemoveCompletedFromGuidedTracings < ActiveRecord::Migration[8.0]
  def change
    remove_column :guided_tracings, :completed, :boolean
  end
end
