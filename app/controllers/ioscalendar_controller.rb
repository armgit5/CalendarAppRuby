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
end
