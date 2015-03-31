class CalendarController < ApplicationController
  def index
    @schedule = Schedule.search(params[:search])
    @last_id = @schedule.last.id
#    created_time = @schedule.find(@last_id).created_at
#    @test = Schedule.where('created_at > ?', created_time)
    if params[:schedule_id]  
      created_time = @schedule.find(params[:schedule_id]).created_at
      @test = Schedule.where('created_at > ?', created_time)
    end
    
    
  end
end
