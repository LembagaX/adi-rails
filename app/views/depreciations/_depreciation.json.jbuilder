json.extract! depreciation, :id, :note, :amount, :quantity, :provider_id, :material_id, :user_id, :provider, :created_at, :updated_at
json.url material_depreciation_url(@material.id, depreciation, format: :json)
