class CalendarController < ApplicationController

  before_filter :authorize

  def index
    if params[:month] == nil
      Rails.logger.info "None Month = #{params[:month]}"
      params[:month] = Time.now.month
    end
    Rails.logger.info "Month test = #{params[:month]}"
    month_up = Integer(params[:month])
    if month_up > 12
      month_up = 1
    end

    @service_schedule_param = params[:service_schedule]

    @schedule = Schedule.where('(extract(month from date) = ? OR extract(month from end_date) = ?)', params[:month], month_up)
    @schedule = @schedule.where(:service_schedule => nil)
    @service_schedule = Schedule.where('(extract(month from date) = ? OR extract(month from end_date) = ?) AND service_schedule = ?', params[:month], month_up, 1)
    Rails.logger.info "service sh = #{@service_schedule}"
    @holidays = Holiday.all
  end

end
