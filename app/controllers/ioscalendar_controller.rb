class IoscalendarController < ActionController::Base

  require 'json'

  def current_user
    @current_user ||= User.find_by_auth_token(cookies[:auth_token]) if cookies[:auth_token]
  end

  def index
    @schedule = Schedule.all
    @holidays = Holiday.all
  end

  def create_timesheet

    Rails.logger.info "timesheet data controller value #{params[:timesheet_nil_sig]}"
    @timesheet = Timesheet.new
    @timesheet.user_id = params[:user_id]
    @timesheet.schedule_id = params[:schedule_id]
    @timesheet.data = params[:data]
    @timesheet.nil_sig = params[:nil_sig]
    @timesheet.cus_sig = params[:cus_sig]
    @timesheet.save!

    @schedule = Schedule.find(params[:schedule_id])
    @schedule.timesheet_id = @timesheet.id
    @schedule.update_attributes!(params[:timesheet_id])

    redirect_to(:controller => "register", :action => "index")
  end

  def timesheet

    id = params[:id]
    @schedule_id = id
    @schedule = Schedule.find(id)

    if current_user.id != @schedule.user_id and current_user.role_id != 3
      redirect_to(:controller => "calendar", :action => "index")
    end

    @current_user_id = @schedule.user_id
    @engineers = ""
    for user in @schedule.users.reverse
      @engineers = user.email.split("@")[0].upcase + ", " + @engineers
    end
    @engineers = @engineers.chop.chop

    @product_types = ""
    for product in @schedule.products.reverse
      @product_types = product.name.upcase + ", " + @product_types
    end
    @product_types = @product_types.chop.chop
  end

  def edit_timesheet

    @schedule = Schedule.where(timesheet_id: params[:id])[0]

    if current_user.id != @schedule.user_id and current_user.role_id != 3
      redirect_to(:controller => "register", :action => "index")
    end

    @timesheet = Timesheet.find(params[:id])
    @timesheet_id = params[:id]
    @timesheet_data = @timesheet.data
  end

  def update_timesheet

    @timesheet = Timesheet.find(params[:id])
    @timesheet.data = params[:data]
    @timesheet.nil_sig = params[:nil_sig]
    @timesheet.cus_sig = params[:cus_sig]
    @timesheet.update_attributes!(params[:timesheet])
    redirect_to(:controller => "register", :action => "index")
  end

end
