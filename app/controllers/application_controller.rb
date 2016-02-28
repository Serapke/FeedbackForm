class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_admin, :current_user, :require_admin, :require_user

	def current_admin
	  @current_admin ||= Admin.find(session[:admin_id]) if session[:admin_id]
	end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

	def require_admin
		redirect_to '/login' unless current_admin
	end

  def require_user
    redirect_to '/login' unless current_user
  end
end
