class DepreciationsController < ApplicationController
  before_action :set_depreciation, only: [:show, :update, :destroy]
  before_action :check_token
  before_action :check_warehouse

  def index
    @depreciations = Depreciation.all
  end

  def show
  end

  def create
    @depreciation = Depreciation.new(depreciation_params)
    if @depreciation.save
      render :show, status: :created, location: @depreciation
    else
      render json: @depreciation.errors, status: :unprocessable_entity
    end
  end

  def update
    if @depreciation.update(depreciation_params)
      render :show, status: :ok, location: @depreciation
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

    def depreciation_params
      params.require(:depreciation).permit(:note, :amount, :quantity, :provider_id, :material_id, :user_id)
    end
end
