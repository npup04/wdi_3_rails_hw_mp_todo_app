require 'pry-byebug'
class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy]

  def new
    @project = Project.find(params[:project_id])
    @list = @project.lists.new
  end
  def show
    @project = Project.find(params[:project_id])
    @tasks = @list.tasks
  end
  def edit
  end
  def create
    @project = Project.find(params[:project_id])
    @list = @project.lists.new(list_params)
    if @list.save
      redirect_to action: :index
    else
      render 'new'
    end
  end
  def update
  end
  def destroy
    @list.destroy
    redirect_to action: :index
  end

  private
  def set_list
    @list = List.find(params[:id])
  end
  def list_params
    params.require(:list).permit(:name)
  end
end
