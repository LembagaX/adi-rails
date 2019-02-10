# == Schema Information
#
# Table name: addresses
#
#  id          :integer          not null, primary key
#  address     :string(120)
#  customer_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryBot.define do
  factory :address do
    address { "MyString" }
    customer { nil }
  end
end
