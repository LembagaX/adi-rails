# == Schema Information
#
# Table name: depreciations
#
#  id          :integer          not null, primary key
#  note        :string(255)
#  amount      :integer
#  quantity    :integer
#  provider_id :integer
#  material_id :integer
#  user_id     :integer
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
