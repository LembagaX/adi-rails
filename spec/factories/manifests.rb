# == Schema Information
#
# Table name: manifests
#
#  id             :bigint(8)        not null, primary key
#  manufacture_id :bigint(8)
#  product_id     :bigint(8)
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
