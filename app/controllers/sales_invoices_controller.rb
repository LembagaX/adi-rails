class SalesInvoicesController < ActionController::Base
  before_action :set_order, :set_user, :set_sales_invoice
  before_action :set_user

  def index
    respond_to do |format|
      format.pdf do
        render pdf: "Sales Invoice",
          template: "sales_invoices/show.html.erb",
          layout: 'pdf.html'
      end
    end
  end

  private
    def set_sales_invoice
      @sales_invoice = @order.sales_invoice
    end

    def set_order
      @order = Order.find_by_number params[:order_id]
    end

    def set_user
      @user = @order.user
    end

end
