json.extract! product, :id, :code, :name, :serial_number, :stock, :category, :created_at, :updated_at
json.assemblies product.assemblies, partial: 'assemblies/assembly', as: :assembly
json.url product_url(product, format: :json)
