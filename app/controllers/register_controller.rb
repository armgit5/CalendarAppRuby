class RegisterController < ApplicationController
#  def show
#    id = params[:id] # retrieve movie ID from URI route
#    @calendar = Schedule.find(id) # look up movie by unique ID
#    # will render app/views/movies/show.<extension> by default
#  end
  
  def schedule
#    @schedule = Schedule.new(:project => "Nilpeter")
  end
  
  def index
    @schedule = Schedule.all
  end

  def show 
    @schedule = Schedule.find(params[:id])
  end
#  
  def edit
    @schedule = Schedule.find(params[:id])
  end
  
  def update
    @schedule = Schedule.find(params[:id])
    @schedule.update_attributes!(params[:schedule])
    flash[:notice] = "#{@schedule.project} was successfully created."
    redirect_to(:action => "show", :id => @schedule.id)
#    redirect_to(:action => "index")
  end
  
  def delete
    
  end
  
  def create
    @schedule = Schedule.create!(params[:schedule])
    flash[:notice] = "#{@schedule.project} was successfully created."
    redirect_to(:action => "index")
  end
  
  

  
end
