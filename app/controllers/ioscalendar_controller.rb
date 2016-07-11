class IoscalendarController < ActionController::Base

  require 'json'

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

    # flash[:notice] = "#{@timesheet.job_num} was successfully created."
    redirect_to(:controller => "register", :action => "index")
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

  def edit_timesheet
    # id = params[:id]
    # @schedule_id = id
    # @schedule = Schedule.find(id)
    # @current_user_id = @schedule.user_id
    # @engineers = ""
    # for user in @schedule.users.reverse
    #   @engineers = user.email.split("@")[0].upcase + ", " + @engineers
    # end
    # @engineers = @engineers.chop.chop
    #
    # @product_types = ""
    # for product in @schedule.products.reverse
    #   @product_types = product.name.upcase + ", " + @product_types
    # end
    # @product_types = @product_types.chop.chop

    # @timesheet = Timesheet.where(schedule_id: params[:id]).last
    @timesheet = Timesheet.find(params[:id])
    @timesheet_id = params[:id]
    @timesheet_data = @timesheet.data
    @timesheet_nil_sig = JSON.parse(@timesheet.nil_sig)
    @timesheet_cus_sig = JSON.parse(@timesheet.cus_sig)
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
