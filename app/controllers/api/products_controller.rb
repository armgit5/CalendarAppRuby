class Api::ProductsController < ApplicationController
      skip_before_filter :verify_authenticity_token
      # http_basic_authenticate_with name: "admin", password: "secret"
      # before_filter  :restrict_access

      def index
        render json: Product.all
      end
  
end
