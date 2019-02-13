# == Schema Information
#
# Table name: depreciations
#
#  id          :bigint(8)        not null, primary key
#  note        :string(255)
#  amount      :integer
#  quantity    :integer
#  provider_id :bigint(8)
#  material_id :bigint(8)
#  user_id     :bigint(8)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryBot.define do
  factory :depreciation do
    note { "MyString" }
    amount { 1 }
    quantity { 1 }
    provider { nil }
    material { nil }
    user { nil }
  end
end
