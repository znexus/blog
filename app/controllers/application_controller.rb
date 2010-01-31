# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  filter_parameter_logging :password, :password_confirmation

  private

    def iniciar
      begin
        @user = User.find params[:user_id]
      rescue
        @user = User.find(:first)
      end
    end

    def autorizado?
      authenticate_user!
      user_signed_in? and current_user.admin
    end

end
