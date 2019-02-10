# == Schema Information
#
# Table name: orders
#
#  id         :integer          not null, primary key
#  price      :integer
#  number     :integer
#  canceled   :boolean
#  user_id    :integer
#  address_id :integer
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
