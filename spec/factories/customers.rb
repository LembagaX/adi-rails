# == Schema Information
#
# Table name: customers
#
#  id         :integer          not null, primary key
#  name       :string(45)
#  phone      :string(13)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  address_id :integer
#

FactoryBot.define do
  factory :customer do
    name { "MyString" }
    phone { "MyString" }
  end
end
