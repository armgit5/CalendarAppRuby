class UsersController < ApplicationController
  
  before_filter :authorize_admin
  
  def new
    @user = User.new
    @sale = Sale.all
    @role = Role.all
  end 
  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to(:controller => "admin", :action => "users")
    else
      render "new"
    end
  end
  def index
    @users = User.all
  end
end
