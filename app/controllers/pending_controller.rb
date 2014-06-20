#class PendingController < ApplicationController
#  def index
#    @pendings = Pending.all
#    
#  end
#  
#  def add_pending
#    @sale = Sale.all
#    @companies = Company.all
#    @statuses = Status.all
#  end
#  
#  def create
#    @pendings = Pending.create!(params[:pending])
#    flash[:notice] = "#{@pendings.project} was successfully created."
#    redirect_to(:action => "index")
#  end
#  
#  def edit
#    @pendings = Pending.find(params[:id])
#    @sales = Sale.all
#    @companies = Company.all
#  end
#  
# 
#
#end
class PendingController < ApplicationController
  
  before_filter :authorize_admin
  
  def index
    @pendings = Pending.order("date desc")
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
  
  def edit_pending
    @pending = Pending.find(params[:id])
    @sale = Sale.all
    @companies = Company.all
    @statuses = Status.all
  end
  
  def update
    @pending = Pending.find(params[:id])
    @pending.update_attributes!(params[:pending])
     
    flash[:notice] = "#{@pending.project} was successfully updated."
    redirect_to(:action => "index")
  end
  
  def delete
    @pending = Pending.find(params[:id])
  end
  
  def destroy
    @pending = Pending.find(params[:id])
    @pending.destroy
    flash[:notice] = "#{@pending.project} was successfully deleted."
    redirect_to(:action => "index")
  end

  def download
    pending = Pending.find(params[:id])
    send_file pending.pdf.current_path
  end
  
end
