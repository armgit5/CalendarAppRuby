class RegisterController < ApplicationController
#  def show
#    id = params[:id] # retrieve movie ID from URI route
#    @calendar = Schedule.find(id) # look up movie by unique ID
#    # will render app/views/movies/show.<extension> by default
#  end
  
#  http_basic_authenticate_with :name => "sales", :password => "npasia"
  
  before_filter :authorize
  
  def schedule
    @sale = Sale.all
    @companies = Company.order("name asc")
    @locations = Location.order("name asc")
    
    @nilpeter_products = Product.where(:type_id => 1)
    @oem1 = Product.where(:type_id => 2).limit(6)
    @oem2 = Product.where(:type_id => 2).last(5)
  end
  
  def index
    params[:sort] ||= "date"
    params[:direction] ||= "desc"
#    user_id = current_user.id
#    if current_user.role_id != 3
#      @schedule = Schedule.where(sale_id: User.find(current_user.id).sale_id)
#      .order(params[:sort] + " " + params[:direction]).search(params[:search])
#      .paginate(:per_page => 25, :page => params[:page])  
#    else 
    @schedule = Schedule.search(params[:search])
    .order(params[:sort] + " " + params[:direction]).search(params[:search])
    .paginate(:per_page => 25, :page => params[:page])
#    end
    @nilpeter_products = Product.where(:type_id => 1)
    @meech_products = Product.where(:type_id => 2)
    @test =  current_user
  end
  
  def export_csv
    schedules = Schedule.all
    csvdata = CSV.generate do |csv|
      # header row
      csv << ["Date & Time", "Company", "Company Location", "Sales Name", "Project Description"]
      schedules.each do |s|
        if s.location.nil?
          csv << [s.date, s.company.name, s.sale.name, s.project]
          else 
          csv << [s.date, s.company.name, s.location.name, s.sale.name, s.project]
        end
      end
    end
    send_data(csvdata, :type => 'text/csv', :filename => 'saleapp_export.csv')
  end

  def show 
    @schedule = Schedule.find(params[:id])
  end
#  
  def edit
    @schedule = Schedule.find(params[:id])
    if current_user.sale_id != @schedule.sale_id
      redirect_to(:action => "index")
    end
    
    @sale = Sale.all
    @companies = Company.all
    @locations = Location.all
    
    @nilpeter_products = Product.where(:type_id => 1)
    @oem1 = Product.where(:type_id => 2).limit(6)
    @oem2 = Product.where(:type_id => 2).last(5)
  end
  
  def update
    @schedule = Schedule.find(params[:id])
    @schedule.update_attributes!(params[:schedule])
    @schedule.product_ids = params[:products]
    flash[:notice] = "#{@schedule.project} was successfully updated."
#    redirect_to(:action => "show", :id => @schedule.id)
    redirect_to(:action => "index")
  end
  
  def delete
    @schedule = Schedule.find(params[:id])
    if current_user.sale_id != @schedule.sale_id
      redirect_to(:action => "index")
    end
  end
  
  def destroy
    @schedule = Schedule.find(params[:id])
    @schedule.destroy
    flash[:notice] = "#{@schedule.project} was successfully deleted."
    redirect_to(:action => "index")
  end
  
  def create
    @schedule = Schedule.create!(params[:schedule])
    @schedule.product_ids = params[:products]
    flash[:notice] = "#{@schedule.project} was successfully created."
    redirect_to(:action => "index")
  end
  
  def calendar
    @schedule = Schedule.all
  end
  
  def create_new
    @company = Company.create!(params[:company])
    flash[:notice] = "#{@company.name} was successfully created."
    redirect_to(:action => "schedule")
  end
  
end
