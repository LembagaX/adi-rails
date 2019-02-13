# == Schema Information
#
# Table name: customers
#
#  id         :bigint(8)        not null, primary key
#  name       :string(45)
#  phone      :string(17)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  address_id :bigint(8)
#

FactoryBot.define do
  factory :customer do
    name { "MyString" }
    phone { "MyString" }
  end
end
