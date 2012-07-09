class ApplicationController < ActionController::Base
  protect_from_forgery

  #before_filter :authorize_admin!, except: [:index, :show]

  private
    def authorize_admin!
      authenticate_user!
      unless current_user.admin?
        redirect_to root_path, alert: "You must be an admin to do that."
      end
    end
end
