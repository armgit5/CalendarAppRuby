class IoscalendarController < ActionController::Base
  def index
    # if params[:month] == nil
    #   Rails.logger.info "None Month = #{params[:month]}"
    #   params[:month] = Time.now.month
    # end
    # @schedule = Schedule.where('extract(month from date) = ? OR extract(month from end_date) = ?', params[:month], params[:month])
    @schedule = Schedule.all
    @holidays = Holiday.all
  end

  def create_timesheet
    Rails.logger.info "timesheet data controller value #{params[:timesheet_data]}"
    @timesheet = Timesheet.new
    @timesheet.user_id = params[:user_id]
    @timesheet.schedule_id = params[:schedule_id]
    @timesheet.timesheet_data = params[:timesheet_data]
    @timesheet.save!
    # flash[:notice] = "#{@timesheet.job_num} was successfully created."
    redirect_to(:controller => "calendar", :action => "index")
  end

  def timesheet
    id = params[:id]
    @schedule_id = id
    @schedule = Schedule.find(id)
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

end
