class ApplicationController < ActionController::API
    def check_token
        if request.headers['token']
            unless User.valid_token? request.headers['token']
                render json: { message: 'token not valid'}, status: :non_authoritative_information
            end
        else
            render json: { message: 'token not found' }, status: :non_authoritative_information
        end
    end
end
