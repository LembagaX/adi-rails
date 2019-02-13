# == Schema Information
#
# Table name: prices
#
#  id          :bigint(8)        not null, primary key
#  amount      :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  material_id :bigint(8)
#  provider_id :bigint(8)
#

FactoryBot.define do
  factory :price do
    amount { 1 }
  end
end
