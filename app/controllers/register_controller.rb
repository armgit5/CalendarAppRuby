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
    @all_days = [1]

    @users = User.all
    @users = @users - [current_user]
    @users = @users - User.where(email: "ios@nilpeter.com")
    third = @users.length / 3
    @engineer1 = @users.slice(0,third)
    @engineer2 = @users.slice(third, third)
    @engineer3 = @users.slice((third)* 2,@users.length)
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
    .order(params[:sort] + " " + params[:direction])
    .paginate(:per_page => 25, :page => params[:page])
#    end
    @nilpeter_products = Product.where(:type_id => 1)
    @meech_products = Product.where(:type_id => 2)

    @test =  current_user

  end

  def export_csv
    begin_month = DateTime.now.at_beginning_of_month
    end_month = begin_month.end_of_month
    Rails.logger.info "None Month = #{params[:pick_month]}"
    if params[:pick_month] == "1"
      begin_month = DateTime.now.at_beginning_of_month << 1
      end_month = begin_month.end_of_month
      Rails.logger.info "picked"
    end
    if params[:pick_month] == "2"
      begin_month = DateTime.now.at_beginning_of_month << 2
      end_month = begin_month.end_of_month
      Rails.logger.info "picked"
    end
    schedules = Schedule.where('date >= ? AND date <= ?',begin_month,end_month).order("date desc")

    csvdata = CSV.generate do |csv|
      # header row
      csv << ["Start Date", "End Date", "Job Num", "Company", "Engineers", "Creator", "Products", "Description"]

      schedules.each do |s|
          enginner_names = []
          products = []
          s.users.each do |e|
            enginner_names.push(e.email.split("@")[0].upcase)
          end
          creator = s.user.email.split("@")[0].upcase unless s.user.nil?
          s.products.each do |p|
            products.push(p.name)
          end
          start_date = s.date.utc.strftime("%d/%m/%Y %H:%M") unless s.date.nil?
          end_date = s.end_date.utc.strftime("%d/%m/%Y %H:%M") unless s.end_date.nil?
          job_num = s.job_num unless s.job_num.nil?
          csv << [start_date, end_date, job_num, s.company_name, enginner_names, creator, products, s.project]
      end
    end
    send_data(csvdata, :type => 'text/csv', :filename => 'serviceapp_export.csv')
  end

  def show
    @schedule = Schedule.find(params[:id])
  end
#
  def edit
    @schedule = Schedule.find(params[:id])
    if current_user.id != @schedule.user_id and current_user.role_id != 3
      redirect_to(:action => "index")
    end

    @sale = Sale.all
    @companies = Company.all
    @locations = Location.all

    @nilpeter_products = Product.where(:type_id => 1)
    @oem1 = Product.where(:type_id => 2).limit(6)
    @oem2 = Product.where(:type_id => 2).last(5)

    @users = User.all
    @users = @users - [current_user]
    @users = @users - ["ios@nilpeter.com"]

    third = @users.length / 3
    @engineer1 = @users.slice(0,third)
    @engineer2 = @users.slice(third, third)
    @engineer3 = @users.slice((third)* 2,@users.length)
  end

  def update
    @schedule = Schedule.find(params[:id])
    @schedule.product_ids = params[:products]
    enginners = []
    enginners.push(params[:engineers])
    # Rails.logger.info "Month update = #{current_user.id}, #{current_user.email}, #{current_user.role_id}"
    if current_user.role_id != 3
      # Rails.logger.info "update current user role id less than 3, #{params[:engineers]}"
      s.user_ids = enginners.push(current_user.id)
    else
      s.user_ids = engineers
    end
    @schedule.update_attributes!(params[:schedule])
    flash[:notice] = "#{@schedule.project} was successfully updated."
#    redirect_to(:action => "show", :id => @schedule.id)
    redirect_to(:controller => "register", :action => "index")
  end

  def delete
    @schedule = Schedule.find(params[:id])
    if current_user.id != @schedule.user_id and current_user.role_id != 3
      redirect_to(:action => "index")
    end
  end

  def destroy
    @schedule = Schedule.find(params[:id])
    if current_user.id != @schedule.user_id and current_user.role_id != 3
      redirect_to(:controller => "register", :action => "index")
    else
      @schedule.destroy
      flash[:notice] = "#{@schedule.project} was successfully deleted."
      redirect_to(:controller => "register", :action => "index")
    end

  end

  def create
    schedule = params[:schedule]
    s = Schedule.create!(schedule)
    s.product_ids = params[:products]
    enginners = []
    enginners.push(params[:engineers])
    # Rails.logger.info "Month create = #{current_user.id}, #{current_user.email}, #{current_user.role_id}, #{params[:engineers]}"
    if current_user.role_id != 3
      # Rails.logger.info "create current user role id less than 3, #{params[:engineers]}"
      s.user_ids = enginners.push(current_user.id)
    else
      s.user_ids = enginners
    end

    flash[:notice] = "#{s.project} was successfully created."
    redirect_to(:controller => "calendar", :action => "index")
  end

  def calendar
    @schedule = Schedule.search(params[:search])
#    old_number = Schedule.count

#    while true do
#      sleep 3
#      num_data = Schedule.count
#      if num_data != old_number
#        redirect_to(:action => "calendar")
#      end
#    end
  end

  def create_new
    @company = Company.create!(params[:company])
    flash[:notice] = "#{@company.name} was successfully created."
    redirect_to(:action => "schedule")
  end

end
