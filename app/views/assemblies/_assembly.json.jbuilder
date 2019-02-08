json.extract! assembly, :id, :product_id, :material_id, :quantity, :created_at, :updated_at
json.url product_assemblies_url(assembly.product, format: :json)
