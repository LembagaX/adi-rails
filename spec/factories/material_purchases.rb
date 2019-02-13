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

FactoryBot.define do
  factory :material_purchase do
    
  end
end
