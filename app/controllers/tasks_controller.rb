class TasksController < ApplicationController

  def index
    parent_id = params[:for] ? params[:for] : nil
    render :json => Task.where(:task_id => parent_id).to_json()
  end

  def create
    task = Task.create(task_params)
    task.save()
    if task.task_id
      parent = Task.find task.task_id
      parent.subtasks_count += 1
      parent.save()
    end
    render :json => task.to_json()
  end

  def subtasks
    render :json => Task.find(params[:id]).tasks.find_all()
  end

  def destroy
    Task.destroy params[:id]
    render :json => {:status => 'ok'}
  end

  def update
    task = Task.find(params[:id])
    task.update_attributes! task_params
    render :json => task.to_json()
  end

  private
    def task_params
      params.require(:task).permit(:name, :task, :task_id)
    end
end
