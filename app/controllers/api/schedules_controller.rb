class Api::SchedulesController < Api::ApiController

      def index
        render json: Schedule.last(10)
      end

      def show
        schedule = Schedule.find(params[:id])
        render json: schedule.as_json
      end

      def create
        schedule = Schedule.new(params[:schedule])
        schedule.product_ids = params[:product_ids]
        if current_user.role_id != 3
          schedule.user_ids = params[:engineers] + [current_user.id]
        else
          schedule.user_ids = params[:engineers]
        end
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
