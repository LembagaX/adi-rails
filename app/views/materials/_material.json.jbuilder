json.extract! material, :id, :name, :stock, :price, :created_at, :updated_at, :providers, :prices
json.url material_url(material, format: :json)
json.code 200
