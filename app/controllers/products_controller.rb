class ProductsController < ApplicationController
  before_action :check_token
  before_action :check_warehouse
  before_action :set_product, only: [:show, :update, :destroy]

  def index
    @products = Product.all
  end

  def show
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      render :show, status: :created, location: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  def update
    if @product.update(product_params)
      render :show, status: :ok, location: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @product.destroy
      render :show, status: :ok, location: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  private
    def set_product
      @product = Product.find_by_code(params[:id])
    end

    def product_params
      params.require(:product).permit(:code, :name, :serial_number, :price, :category_id)
    end
end
