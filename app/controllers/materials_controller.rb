class MaterialsController < ApplicationController
  before_action :set_material, only: [:show, :update, :destroy]
  before_action :check_token

  def index
    @materials = Material.all
  end

  def show
  end

  def update
    if @material.update(material_params)
      render :show, status: :ok, location: @material
    else
      render json: @material.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @material.destroy
      render json: { material: @material, code: 200 }
    else
      render json: { material: @material, code: :unprocessable_entity }, status: :unprocessable_entity
    end
  end

  private
    def set_material
      @material = Material.friendly.find(params[:id])
    end
    def material_params
      params.require(:material).permit(:name)
    end
end
