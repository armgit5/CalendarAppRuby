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
    @timesheet = Timesheet.create!(params[:timesheet])
    flash[:notice] = "#{@timesheet.job_num} was successfully created."
    redirect_to(:controller => "calendar", :action => "index")
  end

  def timesheet
    id = params[:id]
    @schedule = Schedule.find(id)
    @engineers = ""
    for user in @schedule.users.reverse
      @engineers = user.email.split("@")[0].upcase + ", " + @engineers
    end
    @engineers = @engineers.chop.chop
  end
end
