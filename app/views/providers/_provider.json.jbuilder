json.extract! provider, :id, :name, :created_at, :updated_at
json.materials provider.materials, :id, :name, :slug, :stock, :price, :created_at, :updated_at
json.url provider_url(provider, format: :json)
json.code 200
