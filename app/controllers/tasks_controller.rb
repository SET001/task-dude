class TasksController < ApplicationController

  def index
    render :json => Task.all.to_json()
  end

  def create
    task = Task.create(task_params)
    task.save()
    render :json => task.to_json()
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
      params.require(:task).permit(:name)
    end
end
