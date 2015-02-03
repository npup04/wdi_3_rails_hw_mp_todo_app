class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update]

  def show
    @task = Task.find(params[:id])
    # @list = List.find(params[:list_id])
    # @task = @list.tasks.find(params[:id])
    @notes = @task.notes
  end
  def new
  end
  def edit
  end
  def update
    if @task.update(task_params)
      redirect_to action: :show
    else
      render 'edit'
    end
  end
  def destroy
    @list = List.find(params[:list_id])
    @task = @list.tasks.find(params[:id])
    @task.destroy
    redirect_to list_path(@list)
  end

  private
  def set_task
    @task = Task.find(params[:id])
  end
  def task_params
    params.require(:task).permit(:name, :priority)
  end
end
