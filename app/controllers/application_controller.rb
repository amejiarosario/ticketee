class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :authenticate_user!, except: [:index, :show]
  before_filter :authorize_admin!, except: [:index, :show]

  private

  	def authorize_admin!
  		unless current_user.admin?
  			flash[:alert] = "You must be an admin to do that."
  			redirect_to root_path
  		end
  	end
end
