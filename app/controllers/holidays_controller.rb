class HolidaysController < ApplicationController
  
  before_filter :authorize_admin
  
  def index
    @holidays = Holiday.all
  end
  
  def new
    
  end 
  
  def create
    @holiday = Holiday.create!(params[:holiday])
    redirect_to(:controller => "holidays", :action => "index")
  end
  
  def delete
    @holiday = Holiday.find(params[:id])
    @holiday.destroy
    redirect_to(:controller => "holidays", :action => "index")
  end
  
  
end
