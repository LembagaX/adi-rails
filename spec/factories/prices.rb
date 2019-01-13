# == Schema Information
#
# Table name: prices
#
#  id          :integer          not null, primary key
#  amount      :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  material_id :integer
#  provider_id :integer
#

FactoryBot.define do
  factory :price do
    amount { 1 }
  end
end
