class AdminController < ApplicationController
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
#  
#  def location
#    @company = Company.find(params[:id])
#  end

end
