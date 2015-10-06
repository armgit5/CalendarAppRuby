class Api::ProductsController < Api::ApiController

      def index
        render json: Product.all
      end

end
