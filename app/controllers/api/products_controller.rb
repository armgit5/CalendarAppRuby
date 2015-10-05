class Api::ProductsController < Api::ApiController

      def index
        render json: Product.all
        Rails.logger.info "Current user: #{current_user.inspect}"
        
      end

end
