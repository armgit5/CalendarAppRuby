class Api::SchedulesController < ApplicationController
      skip_before_filter :verify_authenticity_token
      # http_basic_authenticate_with name: "admin", password: "secret"
      # before_filter  :restrict_access

      def index
#        month = Time.now.month
#        Schedule.where("date <= :month", month: "2015-01-01")
        render json: Schedule.last(10)
      end

      def show
        schedule = Schedule.find(params[:id])
        render json: schedule.as_json
      end

      def create
        schedule = Schedule.new(params[:schedule])
        if schedule.save
          render status: 200, json: {
    	      message: "Successfully created product",
    	      schedule: schedule
        	}.to_json
        else
          render status: 500, json: {
      	    errors: schedule.errors
          }.to_json
        end
      end

      def update
        schedule = Schedule.find(params[:id])
        if schedule.update_attributes(params[:schedule])
          render status: 200, json: {
    	      message: "Successfully updated product",
    	      schedule: schedule
        	}.to_json
        else
          render status: 500, json: {
      	    errors: schedule.errors
          }.to_json
        end
      end

      def destroy
        item = Schedule.find(params[:id])
        item.destroy
        render status: 200, json: {
          message: "Todo-Item successfully deleted.",
          schedule: item
        }.to_json
      end

    private
      def list_params
        params.require("schedule")
      end
  
end
