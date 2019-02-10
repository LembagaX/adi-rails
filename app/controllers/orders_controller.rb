class OrdersController < ApplicationController
  before_action :check_token
  before_action :check_ability
  before_action :set_order, only: [:show, :update, :destroy]

  def index
    @orders = Order.order created_at: :desc
  end

  def show
  end

  def create
    @order = Order.new(order_params.merge({user: current_user}))

    if @order.save
      render :show, status: :created, location: @order
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  def update
    if @order.update(order_params)
      render :show, status: :ok, location: @order
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end
  
  def destroy
    if @order.destroy
      render :show, status: :ok, location: @order
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  private
    def set_order
      @order = Order.find_by_number(params[:id])
    end

    def order_params
      params.require(:order).permit(:price, :canceled, :address_id)
    end

    def check_ability
      if cannot? :manage, Order
        render json: { message: 'Unauthorized' }, status: :unprocessable_entity
      end
    end
    
end
