class AssembliesController < ApplicationController
  before_action :check_token
  before_action :check_ability
  before_action :set_product
  before_action :set_assembly, only: [:show, :update, :destroy]

  def index
    @assemblies = @product.assemblies
  end

  def show
  end

  def create
    @assembly = @product.assemblies.new(assembly_params)
    if @assembly.save
      render :index, status: :created, location: product_assemblies_url(@product)
    else
      render json: @assembly.errors, status: :unprocessable_entity
    end
  end

  def update
    if @assembly.update(assembly_params)
      render :index, status: :ok, location: product_assemblies_url(@product)
    else
      render json: @assembly.errors, status: :unprocessable_entity
    end
  end
  
  def destroy
    if @assembly.destroy
      render :index, status: :ok, location: product_assemblies_url(@product)
    else
      render json: @assembly.errors, status: :unprocessable_entity
    end
  end

  private
    def set_assembly
      @assembly = @product.assemblies.find(params[:id])
    end

    def set_product
      @product = Product.find_by_code params[:product_id]
    end
    

    def assembly_params
      params.require(:assembly).permit(:material_id, :quantity)
    end

    def check_ability
      if cannot? :manage, Assembly
        render json: { message: 'Unauthorized' }, status: :non_authoritative_information
      end
    end
    
    
end
