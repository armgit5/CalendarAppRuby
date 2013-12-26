class RegisterController < ApplicationController
#  def show
#    id = params[:id] # retrieve movie ID from URI route
#    @calendar = Schedule.find(id) # look up movie by unique ID
#    # will render app/views/movies/show.<extension> by default
#  end
  
  def schedule
#    @schedule = Schedule.new(:project => "Nilpeter")
    @sale = Sale.all
    @companies = Company.all
    @locations = Location.all
#    @schedule = Schedule.new

  end
  
  def index
    params[:sort] ||= "date"
    params[:direction] ||= "desc"
    
    @schedule = Schedule.order(params[:sort] + " " + params[:direction]).search(params[:search]).paginate(:per_page => 25, :page => params[:page])
#    @schedule = Schedule.all
  end

  def show 
    @schedule = Schedule.find(params[:id])
  end
#  
  def edit
    @schedule = Schedule.find(params[:id])
    @sale = Sale.all
    @companies = Company.all
    @locations = Location.all
  end
  
  def update
    @schedule = Schedule.find(params[:id])
    @schedule.update_attributes!(params[:schedule])
    flash[:notice] = "#{@schedule.project} was successfully updated."
#    redirect_to(:action => "show", :id => @schedule.id)
    redirect_to(:action => "index")
  end
  
  def delete
    @schedule = Schedule.find(params[:id])
  end
  
  def destroy
    @schedule = Schedule.find(params[:id])
    @schedule.destroy
    flash[:notice] = "#{@schedule.project} was successfully deleted."
    redirect_to(:action => "index")
  end
  
  def create
    @schedule = Schedule.create!(params[:schedule])
    flash[:notice] = "#{@schedule.project} was successfully created."
    redirect_to(:action => "index")
  end
  
  def calendar
    @schedule = Schedule.all
#    @front_men = ['David St. Hubbins', 'David Lee Roth']
  end
  
  
end
