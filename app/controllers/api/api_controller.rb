module Api
  class ApiController < ApplicationController
    skip_before_filter :verify_authenticity_token
    protect_from_forgery with: :null_session
    before_filter :authenticate, :set_access_control_headers

    def set_access_control_headers
       headers['Access-Control-Allow-Origin'] = '*'
       headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
       headers['Access-Control-Request-Method'] = '*'
       headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
    end

    def current_user
      @current_user
    end

    # def mobile_user
    #   User.find(params[:user_id])
    # end

    def authenticate
      authenticate_or_request_with_http_basic do |email, password|
        Rails.logger.info "API authentication: #{email} #{password}"
        if !email.include? "@"
          email = email + "@nilpeter.com"
        end
        user = User.find_by_email(email)
        if user && user.authenticate(password)
          @current_user = user
          Rails.logger.info "Logging in #{user.inspect}"
          true
        else
          Rails.logger.warn "No valid credentials"
          render status: 401, json: {
            message: "Failed to find user"
          }.to_json
          true
        end
      end
    end
  end
end
