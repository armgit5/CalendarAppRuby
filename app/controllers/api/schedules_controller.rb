class Api::SchedulesController < Api::ApiController

      def index
        # begin_month = DateTime.now.at_beginning_of_month
        # end_month = begin_month.end_of_month
        # schedules = Schedule.where('date >= ? AND date <= ?',begin_month,end_month).order("date desc")
        # render json: schedules
        schedule = Schedule.where('user_id = ?', params[:id]).order("id desc").limit(25)
        render json: schedule
      end

      def find_users
        schedule = Schedule.find(params[:id])
        render json: schedule.users, only: [:email, :id]
      end


      def show
        schedule = Schedule.find(params[:id])
        render json: [schedule.as_json]
      end

      def create
        schedule = Schedule.new(params[:schedule])
        schedule.product_ids = params[:product_ids]
        schedule.user_ids = params[:engineer_ids]
        # if mobile_user.find_by_email("admin@nilpeter.com")
        #   schedule.user_ids = params[:engineer_ids] + params[:user_id]
        # else
        #   schedule.user_ids = params[:engineer_ids] + params[:user_id]
        # end
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
