# == Schema Information
#
# Table name: assemblies
#
#  id          :integer          not null, primary key
#  product_id  :integer
#  material_id :integer
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
