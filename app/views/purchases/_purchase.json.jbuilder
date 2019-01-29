json.extract! purchase, :id, :invoice, :note, :amount, :purchased_at, :provider, :material_purchases, :created_at, :updated_at
json.url material_purchases_url(@material.id, purchase, format: :json)