class ApplicationController < ActionController::Base
  protect_from_forgery
#  config.assets.initialize_on_precompile = false

private 

  def current_user
#    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    @current_user ||= User.find_by_auth_token(cookies[:auth_token]) if cookies[:auth_token]
  end
  helper_method :current_user
  
  def authorize
    redirect_to login_url, notice: "Not authorized" if current_user.nil?
  end
  
  def authorize_admin
    redirect_to login_url, notice: "Please login as admin" if current_user.role_id != 3
  end
end
