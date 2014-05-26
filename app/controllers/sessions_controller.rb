class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
#      session[:user_id] = user.id
      if params[:remember_me]
       cookies.permanent[:auth_token] = user.auth_token
      else
       cookies[:auth_token] = user.auth_token  
      end
      redirect_to root_url, notice: "Logged in!"
    else
      redirect_to login_url, notice: "Email or password is invalid."
    end
  end
  
  def destroy
#    session[:user_id] = nil
    cookies.delete(:auth_token)
    redirect_to root_url, notice: "Logged out!"
  end
end
