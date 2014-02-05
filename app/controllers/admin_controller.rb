class AdminController < ApplicationController
  
  http_basic_authenticate_with :name => "admin", :password => "nilp3ter"
#  before_filter :login
#  before_filter :authenticate
#
#  def authenticate
#    authenticate_or_request_with_http_basic('Administration') do |username, password|
#      username == 'admin' && password == 'password'
##        true
##      else
##        redirect_to '/register/calendar'
##      end
#    end
#  end
  
  def index
    @companies = Company.order('name ASC').paginate(:per_page => 25, :page => params[:page])
  end
  
  def create
    @company = Company.create!(params[:company])
    flash[:notice] = "#{@company.name} was successfully created."
    redirect_to(:action => "index")
  end
  
  def edit
    @company = Company.find(params[:id])
  end

  def update
    @company = Company.find(params[:id])
    @company.update_attributes!(params[:company])
    flash[:notice] = "#{@company.name} was successfully updated."
#    redirect_to(:action => "show", :id => @schedule.id)
    redirect_to(:action => "index")
  end
#  
  def delete
    @company = Company.find(params[:id])
  end
  
  def destroy
    @company = Company.find(params[:id])
    @company.destroy
    flash[:notice] = "#{@company.name} was successfully deleted."
    redirect_to(:action => "index")
  end
  
  def login
#    authenticate_or_request_with_http_basic do |username, password|
#    if(username == "arm" && password == "123")
#      redirect_to '/admin/index'
#    else
#      redirect_to '/register/calendar'
#    end
#    end
  end
#  
#  def location
#    @company = Company.find(params[:id])
#  end

end
