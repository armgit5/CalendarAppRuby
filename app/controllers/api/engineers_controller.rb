class Api::EngineersController < Api::ApiController

      def index
        render json: User.all - [current_user]
      end

end
