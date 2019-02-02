json.extract! manufacture, :id, :code, :manifests, :products_created, :created_at, :updated_at
json.partial! manufacture.user, partial: 'users/user', as: :user
json.manifests manufacture.manifests, partial: 'manifests/manifest', as: :manifest
json.url manufacture_url(manufacture, format: :json)
