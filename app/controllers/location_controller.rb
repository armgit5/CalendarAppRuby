class LocationController < ApplicationController
  def index
    @company = Company.find(params[:id])
  end

   def create
    @location = Location.create!(params[:location])
    flash[:notice] = "#{@location.name} was successfully created."
#    redirect_to(:action => "index")
    redirect_to :back
  end
  
  def edit
    @location = Location.find(params[:id])
  end
#
  def update
    @location = Location.find(params[:id])
    @location.update_attributes!(params[:location])
    param = @location.company_id
    flash[:notice] = "#{@location.name} was successfully updated."
    redirect_to(:action => "index", :id => param)
  end
#  
  def delete   
    @location = Location.find(params[:id])
    
  end
#  
  def destroy
    @location = Location.find(params[:id])
    param = @location.company_id
    @location.destroy
    flash[:notice] = "#{@location.name} was successfully deleted."
    redirect_to(:action => "index", :id => param)
  end
end
 