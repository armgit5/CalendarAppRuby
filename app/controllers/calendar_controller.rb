class CalendarController < ApplicationController

  before_filter :authorize

  def index
    if params[:month] == nil
      Rails.logger.info "None Month = #{params[:month]}"
      params[:month] = Time.now.month
    end
    Rails.logger.info "Month = #{params[:month]}"
    @schedule = Schedule.where('extract(month from date) = ?', params[:month])
    @holidays = Holiday.all
  end

end
