class Api::LocationsController < ApplicationController
      skip_before_filter :verify_authenticity_token
      # http_basic_authenticate_with name: "admin", password: "secret"
      # before_filter  :restrict_access

      def index
        render json: Location.last(10)
      end
  
end
