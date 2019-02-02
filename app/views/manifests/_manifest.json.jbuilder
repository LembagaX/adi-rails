json.extract! manifest, :id, :quantity, :manufacture, :product, :created_at, :updated_at
json.url manufacture_manifests_url(manifest.manufacture, manifest, format: :json)
