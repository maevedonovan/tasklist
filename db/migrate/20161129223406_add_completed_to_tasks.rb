class AddCompletedToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :is_completed, :boolean, default: false
  end
end
