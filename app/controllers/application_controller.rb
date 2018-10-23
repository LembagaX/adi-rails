class ApplicationController < ActionController::API
  before_action :handle_preflight_request

  def handle_preflight_request
    if request.method_symbol == :options
      head :ok
    end
  end
end
