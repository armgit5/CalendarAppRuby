class RegisterController < ApplicationController
#  def show
#    id = params[:id] # retrieve movie ID from URI route
#    @calendar = Schedule.find(id) # look up movie by unique ID
#    # will render app/views/movies/show.<extension> by default
#  end
  
  def schedule
    @calendar = Schedule.new(:project => "Nilpeter")
  end
  
  def index
    @calendar = Schedule.all
  end

#  def new
#    @calendar = Schedule.new()
#  end
#  
#  def show 
#    
#  end
  
  def create
    @calendar = Schedule.create!(params[:schedule])
    flash[:notice] = "#{@calendar.project} was successfully created."
    redirect_to(:action => "index")
  end

  
end
