# == Schema Information
#
# Table name: assemblies
#
#  id          :bigint(8)        not null, primary key
#  product_id  :bigint(8)
#  material_id :bigint(8)
#  quantity    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryBot.define do
  factory :assembly do
    product { nil }
    material { nil }
    quantity { 1 }
  end
end
