json.extract! manifest, :id, :quantity, :created_at, :updated_at
json.manufacture manifest.manufacture, partial: 'manufactures/manufacture', as: :manufacture
json.product manifest.product, partial: 'products/product', as: :product
json.url manufacture_manifests_url(manifest.manufacture, manifest, format: :json)
