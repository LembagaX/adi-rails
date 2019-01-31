# == Schema Information
#
# Table name: material_purchases
#
#  id          :integer          not null, primary key
#  material_id :integer
#  purchase_id :integer
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
