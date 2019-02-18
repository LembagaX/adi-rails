json.extract! order, :id, :price, :number, :canceled, :user_id, :ship_to, :bill_to, :carts, :invoice, :created_at, :updated_at
json.url order_url(order.number, format: :json)
json.partial! "delivery_orders/delivery_order", delivery_order: order.delivery_order
