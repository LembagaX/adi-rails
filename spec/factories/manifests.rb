# == Schema Information
#
# Table name: manifests
#
#  id             :integer          not null, primary key
#  manufacture_id :integer
#  product_id     :integer
#  quantity       :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

FactoryBot.define do
  factory :manifest do
    manufacture { nil }
    product { nil }
    quantity { 1 }
  end
end
