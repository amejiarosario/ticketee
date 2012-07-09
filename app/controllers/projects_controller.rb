class ProjectsController < ApplicationController
  before_filter :authorize_admin!, :except => [:index, :show]
  before_filter :find_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end
  
  def create
    @project = Project.new(params[:project])
    if @project.save
      redirect_to @project, notice: "Project has been created."
    else
      flash.now[:alert] = "Project has not been created."
      render action: "new"
    end
  end
  
  def show
  end
  
  def edit
  end
  
  def update
    if @project.update_attributes(params[:project])
      redirect_to @project, notice: "Project has been updated."
    else
      flash.now[:alert] = "Project has not been updated."
      render action: "edit"
    end
  end
  
  def destroy
    @project.destroy
    redirect_to projects_path, notice: "Project has been deleted."
  end
  
  private
    def find_project
      @project = Project.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to projects_path, alert: "The project you were looking for does not exist"
    end

    def authorize_admin!
      authenticate_user!
      unless current_user.admin?
        redirect_to root_path, alert: "You must be an admin to do that."
      end
    end
end
