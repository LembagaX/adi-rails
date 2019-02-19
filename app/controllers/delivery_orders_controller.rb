class DeliveryOrdersController < ActionController::Base
  before_action :set_order, :set_user, :set_delivery_order

  def index
    respond_to do |format|
      format.pdf do
        render pdf: "Delivery Order",
          template: "delivery_orders/show.html.erb",
          layout: 'pdf.html'
      end
    end
  end

  private
    def set_delivery_order
      @delivery_order = @order.delivery_order
    end

    def set_order
      @order = Order.find_by_number params[:order_id]
    end

    def set_user
      @user = @order.user
    end

    def delivery_order_params
      params.require(:delivery_order).permit(:number)
    end
end
