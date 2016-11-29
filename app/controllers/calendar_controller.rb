class CalendarController < ApplicationController

  before_filter :authorize

  def index
    if params[:month] == nil
      Rails.logger.info "None Month = #{params[:month]}"
      params[:month] = Time.now.month
    end
    Rails.logger.info "Month test = #{params[:month]}"
    month_up = Integer(params[:month]) + 1
    if month_up > 12
      month_up = 1
    end

    @schedule = Schedule.where('extract(month from date) = ? OR extract(month from end_date) = ?', params[:month], month_up)
    @holidays = Holiday.all
  end

end
