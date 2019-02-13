# == Schema Information
#
# Table name: material_purchases
#
#  id          :bigint(8)        not null, primary key
#  material_id :bigint(8)
#  purchase_id :bigint(8)
#  price       :integer
#  quantity    :integer
#

class MaterialPurchase < ApplicationRecord
    belongs_to :material
    belongs_to :purchase

    validates_presence_of :material_id
    validates_presence_of :purchase_id
    validates_presence_of :price
    validates_presence_of :quantity
end
