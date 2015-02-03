class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update]

  def show
    @task = Task.find(params[:id])
    @notes = @task.notes
  end
  def new
    @list = List.find(params[:list_id])
    @task = @list.tasks.new

    # when you have nested resources, it's important (and tricky) to associate a new item with its parent
    # if you just do @task = Task.new it will have a parent of nil
    # so you need to first find the list via the params, and then create a new task directly on that list with @list.tasks.new
  end

  def create
    @list = List.find(params[:list_id])
    @task = @list.tasks.new(task_params)
    if @task.save
      redirect_to @task
    else
      render :new
    end

    # same here - need to find list first, then create a new task directly on that list
    # the if-else logic is somewhat optional but it's best-practice because it makes it really obvious when a task didn't save
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
    # in this action, the params hash does NOT include the list id, just the task id
    # so you have to find the task first (from that id), and then look for its associated list
    @task = Task.find(params[:id])
    @list = @task.list
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
