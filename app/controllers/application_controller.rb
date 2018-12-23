class ApplicationController < ActionController::API
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
end
