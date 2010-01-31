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

    def store_location
      session[:return_to] = request.request_uri
    end
    
    def redirect_back_or_default(default)
      redirect_to(session[:return_to] || default)
      session[:return_to] = nil
    end
    
    def no_autorizado
      flash[:error] = "Necesitas credenciales adicionales para acceder a esa página"
      redirect_to :root
      return false
    end
    
    def autorizado?
      authenticate_user!
      unless current_user and (current_user.admin)
        no_autorizado
      end
    end

end
