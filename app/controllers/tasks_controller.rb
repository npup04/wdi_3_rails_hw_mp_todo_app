class TasksController < ApplicationController
  before_action :set_task, only: [:show]

  def show
    @list = List.find(params[:list_id])
    @notes = @task.notes
  end

  private
  def set_task
    @task = Task.find(params[:id])
  end
  def list_params
    params.require(:list).permit(:name)
  end
end
