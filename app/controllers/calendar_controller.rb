class CalendarController < ApplicationController

  before_filter :authorize

  def index
    @schedule = Schedule.where('extract(month from date) = ?', 9)
    @holidays = Holiday.all
  end

end
