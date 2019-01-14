class ProvidersController < ApplicationController
  before_action :set_provider, only: [:show, :update, :destroy]
  before_action :check_token

  def index
    @providers = Provider.all
  end

  def show
  end

  def update
    if @provider.update(provider_params)
      render :show, status: :ok, location: @provider
    else
      render json: @provider.errors, status: :unprocessable_entity
    end
  end
  
  def destroy
    unless !@provider.materials.empty?
      if @provider.destroy
        render json: { provider: @provider, code: 200 }, status: :ok
      end
    else
      render json: { message: 'Forbiden to destroy, attached to Materials', code: 400 }, status: 400
    end
  end

  private
    def set_provider
      @provider = Provider.friendly.find(params[:id])
    end

    def provider_params
      params.require(:provider).permit(:name)
    end
end
