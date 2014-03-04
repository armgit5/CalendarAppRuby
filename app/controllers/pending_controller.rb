class PendingController < ApplicationController
  def index
    @pendings = Pending.all
    
  end
  
  def add_pending
    @sale = Sale.all
    @companies = Company.all
    @statuses = Status.all
  end
  
  def create
    @pendings = Pending.create!(params[:pending])
    flash[:notice] = "#{@pendings.project} was successfully created."
    redirect_to(:action => "index")
  end
  
  def edit
    @pending = Pending.find(params[:id])
    @sale = Sale.all
    @companies = Company.all
  end
  
 

end
