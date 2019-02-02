json.extract! manufacture, :id, :code, :created_at, :updated_at
json.partial! manufacture.user, partial: 'users/user', as: :user
json.url manufacture_url(manufacture, format: :json)
