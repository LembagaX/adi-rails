class DeliveryOrdersController < ActionController::Base
  before_action :set_delivery_order, only: [:show, :update, :destroy]

  def index
    @delivery_orders = DeliveryOrder.all
  end

  def show
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "Delivery Order",
          template: "delivery_orders/show.html.erb",
          layout: 'pdf.html'
      end
    end
  end

  def create
    @delivery_order = DeliveryOrder.new(delivery_order_params)

    if @delivery_order.save
      render :show, status: :created, location: @delivery_order
    else
      render json: @delivery_order.errors, status: :unprocessable_entity
    end
  end

  def update
    if @delivery_order.update(delivery_order_params)
      render :show, status: :ok, location: @delivery_order
    else
      render json: @delivery_order.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @delivery_order.destroy
  end

  private
    def set_delivery_order
      @delivery_order = DeliveryOrder.find_by_number params[:id]
    end

    def set_order
      @order = Order.find_by_number params[:order_id]
    end

    def delivery_order_params
      params.require(:delivery_order).permit(:number)
    end
end
