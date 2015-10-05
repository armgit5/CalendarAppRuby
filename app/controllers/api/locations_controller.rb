class Api::LocationsController < Api::ApiController

      def index
        render json: Location.all
      end

end
