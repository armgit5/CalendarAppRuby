class VisitorsController < ApplicationController
  def index
    @schedule = Schedule.all
  end
end
