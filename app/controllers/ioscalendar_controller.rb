class IoscalendarController < ActionController::Base
  def index
    @schedule = Schedule.search(params[:search])
    @holidays = Holiday.all
  end
end
