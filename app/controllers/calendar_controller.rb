class CalendarController < ApplicationController

  before_filter :authorize

  def index
    @schedule = Schedule.where('extract(month from date) = ?', params[:month])
    @holidays = Holiday.all
  end

end
