class ApplicationController < ActionController::API
  before_action :set_response_code

  def set_response_code
    @code = 400
  end
  def check_token
      if request.headers['token']
          unless User.valid_token? request.headers['token']
              render json: { message: 'token not valid'}, status: :non_authoritative_information
          else
            @current_user = User.find_by_token request.headers[:token]
          end
      else
          render json: { message: 'token not found' }, status: :non_authoritative_information
      end
  end

  def current_user
    @current_user ||= User.new
  end

  def check_warehouse
    unless can? :manage, Depreciation
      render json: { message: 'unauthorized' }, status: :non_authoritative_information
    end
  end
end
