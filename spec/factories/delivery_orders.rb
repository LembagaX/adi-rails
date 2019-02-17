# == Schema Information
#
# Table name: delivery_orders
#
#  id         :bigint(8)        not null, primary key
#  number     :integer
#  order_id   :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :delivery_order do
    number { 1 }
    order { nil }
  end
end
