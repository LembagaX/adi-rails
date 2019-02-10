json.extract! address, :id, :address, :customer, :created_at, :updated_at
json.url customer_addresses_url(address.customer, address, format: :json)
