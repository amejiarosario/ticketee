class Admin::UsersController < ApplicationController
  before_filter :authorize_admin!
  before_filter :find_user, :only => [:show, :edit, :update, :destroy]

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
	    render action: "new"
	  end
	end

	def edit
	end

	def show
	end

	def update
	  if params[:user][:password].blank?
	    params[:user].delete(:password)
	    params[:user].delete(:password_confirmation)
	  end

		@user.skip_confirmation!
		if @user.update_attributes(params[:user]) 
			redirect_to admin_users_path, notice: "User has been updated."
		else
			flash.now[:alert] = "User has not been updated."
			render "edit"
		end
	end

	private
		def find_user
			@user = User.find(params[:id])
		end

end
