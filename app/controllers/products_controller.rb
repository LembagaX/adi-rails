class ProductsController < ApplicationController
  before_action :check_token
  before_action :set_product, only: [:show, :update, :destroy]
  before_action :can_manage, except: [:update]
  before_action :can_set_price, only: [:create, :update]

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
      params.require(:product).permit(:code, :name, :price, :category_id)
    end

    def can_manage
      unless can? :manage, Product
        render json: { message: 'Unable to Manage Product' }, status: :non_authoritative_information
      end
    end

    def can_set_price
      if params[:price] != 0
        unless can? :set_price, Product
          render json: { message: 'Unable to set Product Price, Unauthorized' }, status: :non_authoritative_information
        end
      end
    end
end
