class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end
  def new
    @project = Project.new
  end
  def edit
    @project = Project.find(params[:id])
  end
  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to action: :index
    else
      render 'new'
    end
  end
  def update
    @project = Project.find(params[:id])
    if @project.update(project_params)
      # @project.update_attributes(project_params)
      redirect_to action: :index
    else
      render 'edit'
    end
  end
  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to action: :index
  end

  private
  def project_params
    params.require(:project).permit(:name)
  end
end
