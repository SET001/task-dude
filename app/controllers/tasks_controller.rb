class TasksController < ApplicationController

  def index
    render :json => Task.all.to_json()
  end
end
