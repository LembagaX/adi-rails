# == Schema Information
#
# Table name: products
#
#  id            :integer          not null, primary key
#  code          :string(10)
#  name          :string(60)
#  serial_number :string(15)
#  price         :integer
#  user_id       :integer
#  category_id   :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
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
