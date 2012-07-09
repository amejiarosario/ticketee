class Admin::UsersController < ApplicationController
  before_filter :authorize_admin!

  def index
  	@users = User.all(order: 'email')
  end

  def new
  	@user = User.new
  end

  def create
	  @user = User.new(params[:user])
	  if @user.save
	    redirect_to admin_users_path, notice: "User has been created."
	  else
	  	flash.now[:alert] = "User has not been created."
	    render :action => "new"
	  end
	end

end
