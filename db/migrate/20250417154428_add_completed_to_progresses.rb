class AddCompletedToProgresses < ActiveRecord::Migration[8.0]
  def change
    add_column :progresses, :completed, :boolean, default: false
  end
end
