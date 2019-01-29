class DepreciationsController < ApplicationController
  before_action :set_depreciation, only: [:show, :update, :destroy]
  before_action :check_token
  before_action :check_warehouse
  before_action :set_material

  def index
    @depreciations = @material.depreciations
  end

  def show
  end

  def create
    @depreciation = Depreciation.new(depreciation_params)
    if @depreciation.save
      stock = @depreciation.material.stock - @depreciation.quantity
      @depreciation.material.update stock: stock
      render :show, status: :created, location: material_depreciation_url(@material, @depreciation)
    else
      render json: @depreciation.errors, status: :unprocessable_entity
    end
  end

  def update
    if @depreciation.update(depreciation_params)
      render :show, status: :ok, location: material_depreciation_url(@material, @depreciation)
    else
      render json: @depreciation.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @depreciation.destroy
  end

  private
    def set_depreciation
      @depreciation = Depreciation.find(params[:id])
    end

    def set_material
      @material = Material.find(params[:material_id])
    end
    
    def depreciation_params
      params.require(:depreciation).permit(:note, :amount, :quantity, :provider_id, :material_id, :user_id)
    end
end
