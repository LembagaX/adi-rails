json.extract! order, :id, :price, :number, :canceled, :user_id, :ship_to, :bill_to, :carts, :invoice, :delivery_order, :sales_invoice, :created_at, :updated_at
json.delivery_order_pdf order_delivery_orders(order, format: :pdf)
json.sales_invoice_pdf order_sales_invoices(order, format: :pdf)
