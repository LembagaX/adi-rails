json.extract! material, :id, :name, :slug, :stock, :price, :created_at, :updated_at, :providers, :prices
json.url material_url(material, format: :json)
json.code 200
