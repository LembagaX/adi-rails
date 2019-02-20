class AdvertisesController < ApplicationController
  before_action :check_token, :check_ability, only: [:create, :attach, :detach]
  before_action :set_advertise, only: [:show, :update, :destroy, :attach, :detach]
  before_action :set_catalog, only: [:index, :attach, :detach]

  def index
    if @catalog
      @advertises = @catalog.advertises
    else
      @advertises = Advertise.order created_at: :desc
    end
  end

  def show
  end

  def attach
    begin
      @catalog.advertises.find params[:id]
    rescue ActiveRecord::RecordNotFound
      @catalog.advertises << @advertise
    end
    render json: @catalog, status: :created, location: catalog_advertises_url(@catalog, @advertises)
  end

  def detach
    @catalog.advertises.destroy @advertise
    render json: @catalog, status: :created, location: catalog_advertises_url(@catalog, @advertises)
  end

  def create
    @advertise = Advertise.new(advertise_params)

    if @advertise.save
      render :show, status: :created, location: @advertise
    else
      render json: @advertise.errors, status: :unprocessable_entity
    end
  end

  def update
    if @advertise.update(advertise_params)
      render :show, status: :ok, location: @advertise
    else
      render json: @advertise.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @advertise.destroy
  end

  private
    def set_advertise
      begin
        @advertise = Advertise.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        return record_not_found
      end
    end

    def advertise_params
      params.require(:advertise).permit(:description, :product_id, :image)
    end

    def set_catalog
      begin
        @catalog = Catalog.find params[:catalog_id]
      rescue ActiveRecord::RecordNotFound
      end
    end

    def check_ability
      if cannot? :manage, Catalog
        render json: { message: 'unauthorized' }, status: :non_authoritative_information
      end
    end
end
