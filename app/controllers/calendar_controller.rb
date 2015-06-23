class CalendarController < ApplicationController
  
  before_filter :authorize
  
  def index
    @time = params[:time_id]
    @schedule = Schedule.search(params[:search])
    @holidays = Holiday.all
    @last_id = @schedule.last.id
#    created_time = @schedule.find(@last_id).created_at
#    @test = Schedule.where('created_at > ?', created_time)
    if params[:schedule_id]  
      created_time = @schedule.find(params[:schedule_id]).created_at
      @test = Schedule.where('created_at > ?', created_time)
    end
    
    
  end
end
