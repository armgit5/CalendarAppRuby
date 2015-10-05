class CalendarController < ApplicationController

  before_filter :authorize

  def index
    @schedule = Schedule.search(params[:search])
    @holidays = Holiday.all
  end
  
end
