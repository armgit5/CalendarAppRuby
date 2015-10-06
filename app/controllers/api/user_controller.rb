class Api::UserController < ApplicationController

    def index
      render status: 200, json: [{

          message: "Successfully login",
          user_id: current_user.id

      }].to_json
    end

end
