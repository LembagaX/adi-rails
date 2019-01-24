class MaterialPurchase < ApplicationRecord
    self.table_name = 'materials_purchases'
    belongs_to :material
    belongs_to :purchase

    validates_presence_of :material_id
    validates_presence_of :purchase_id
    validates_presence_of :price
    validates_presence_of :quantity
end
