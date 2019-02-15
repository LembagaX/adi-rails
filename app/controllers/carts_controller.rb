class CartsController < ApplicationController
  before_action :check_token
  before_action :check_ability
  before_action :set_order
  before_action :set_cart, only: [:show, :update, :destroy]

  def index
    @carts = @order.carts
  end

  def show
  end

  def create
    if @order.carts.create cart_params.require(:carts)
      render :index, status: :created, location: order_carts_url(@order)
    else
      render json: @cart.errors, status: :unprocessable_entity
    end
  end

  def update
    if @cart.update(cart_params)
      render :show, status: :ok, location: @cart
    else
      render json: @cart.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @cart.destroy
  end

  private
    def set_cart
      @cart = Cart.find(params[:id])
    end

    def cart_params
      params.permit(carts: [:product_id, :quantity])
    end

    def check_ability
      if cannot? :manage, Cart
        render json: { message: 'unauthorized' }, status: :non_authoritative_information
      end
    end

    def set_order
      @order = Order.find_by_number params[:order_id]
    end
end
