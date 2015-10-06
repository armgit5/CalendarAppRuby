class Api::CompaniesController < Api::ApiController

      def index
        render json: Company.all
      end

end
