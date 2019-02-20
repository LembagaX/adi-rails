class CatalogsController < ApplicationController
  before_action :check_token, :check_ability
  before_action :set_catalog, only: [:show, :update, :destroy]

  def index
    @catalogs = Catalog.order created_at: :desc
  end

  def show
  end

  def create
    @catalog = Catalog.new(catalog_params)

    if @catalog.save
      render :show, status: :created, location: @catalog
    else
      render json: @catalog.errors, status: :unprocessable_entity
    end
  end

  def update
    if @catalog.update(catalog_params)
      render :show, status: :ok, location: @catalog
    else
      render json: @catalog.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @catalog.destroy
      render :show, status: :ok, location: @catalog
    else
      render json: @catalog.errors, status: :unprocessable_entity
    end
  end

  private
    def set_catalog
      begin
        @catalog = Catalog.friendly.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        return record_not_found
      end
    end

    def catalog_params
      params.require(:catalog).permit(:title, :description)
    end

    def check_ability
      if cannot? :manage, Catalog
        render json: { message: 'unauthorized' }, status: :non_authoritative_information
      end
    end
end
