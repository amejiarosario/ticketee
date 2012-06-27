class TicketsController < ApplicationController
  before_filter :find_project
  before_filter :find_ticket, only: [:show,:edit,:update,:destroy]
  
  def new
    @ticket = @project.tickets.build
  end
  
  def show
  end
  
  def edit
  end
  
  def update
    logger.info "------ ** "
    if @ticket.update_attributes(params[:ticket])
      logger.info "** ------"
      redirect_to [@project, @ticket], notice: "Ticket has been created."
    else
      logger.info "** the else ------"
      flash.now[:alert] = "Ticket has not been updated."
      render action: "edit"
    end
  end
  
  def create
    @ticket = @project.tickets.build(params[:ticket])
    if @ticket.save
      redirect_to [@project, @ticket], notice: "Ticket has been created."
    else
      flash.now[:alert] = "Ticket has not been created."
      render action: "new"
    end
  end
  
  private
    def find_project
      @project = Project.find(params[:project_id])
    end
    
    def find_ticket
      @ticket = @project.tickets.find(params[:id])
    end

end
