class ManifestsController < ApplicationController
  before_action :check_token
  before_action :check_warehouse
  before_action :set_manifest, only: [:show, :update, :destroy]
  before_action :look_for_manifest, only: [:create]

  def index
    @manifests = Manifest.all
  end

  def show
  end

  def create
    @manifest = Manufacture.find_by_code(params[:manufacture_id]).manifests.new(manifest_params)

    if @manifest.save
      update_product
      render :show, status: :created, location: manufacture_manifests_url(@manifest.manufacture, @manifest, format: :json)
    else
      render json: @manifest.errors, status: :unprocessable_entity
    end
  end

  def update
    if @manifest.update(manifest_params)
      render :show, status: :ok, location: manufacture_manifests_url(@manifest.manufacture, @manifest, format: :json)
    else
      render json: @manifest.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @manifest.destroy
  end

  private
    def set_manifest
      @manifest = Manifest.find(params[:id])
    end

    def manifest_params
      params.require(:manifest).permit(:product_id, :quantity)
    end

    def look_for_manifest
      @manifest = Manufacture.find_by_code(params[:manufacture_id]).manifests.find_by_product_id manifest_params[:product_id]
      if @manifest
        @manifest.update quantity: @manifest.quantity + manifest_params[:quantity]
        update_product
        render :show, status: :ok, location: manufacture_manifests_url(@manifest.manufacture, @manifest, format: :json)
      end
    end

    def update_product
      product = @manifest.product
      product.update stock: product.stock + manifest_params[:quantity]
    end
end
