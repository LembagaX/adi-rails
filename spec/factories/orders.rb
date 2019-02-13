# == Schema Information
#
# Table name: orders
#
#  id         :bigint(8)        not null, primary key
#  price      :integer
#  number     :integer
#  canceled   :boolean
#  user_id    :bigint(8)
#  address_id :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :order do
    price { 1 }
    number { "MyString" }
    canceled { "MyString" }
    user { nil }
    address { nil }
  end
end
