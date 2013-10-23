class AddParentTaskId < ActiveRecord::Migration
  def change
    add_column :tasks, :task_id, :integer
    add_column :tasks, :subtasks_count, :integer
  end
end
