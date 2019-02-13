# == Schema Information
#
# Table name: products
#
#  id            :bigint(8)        not null, primary key
#  code          :string(10)
#  name          :string(60)
#  serial_number :string(15)
#  price         :integer
#  category_id   :bigint(8)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  stock         :integer
#

FactoryBot.define do
  factory :product do
    code { "MyString" }
    name { "MyString" }
    serial_number { "MyString" }
    price { 1 }
    user { nil }
    category { nil }
  end
end
