# == Schema Information
#
# Table name: carts
#
#  id         :bigint(8)        not null, primary key
#  order_id   :bigint(8)
#  product_id :bigint(8)
#  quantity   :integer
#  price      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :cart do
    order { nil }
    product { nil }
    quantity { 1 }
    price { 1 }
  end
end
