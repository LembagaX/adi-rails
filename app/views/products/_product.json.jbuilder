json.extract! product, :id, :code, :name, :serial_number, :price, :category, :created_at, :updated_at
json.url product_url(product, format: :json)
