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

class Cart < ApplicationRecord
  belongs_to :order
  belongs_to :product

  validates_presence_of :price
  validates_numericality_of :price, is_greater_than: 0, is_less_than: 2147483647

  validates_presence_of :quantity
  validates_numericality_of :quantity, is_greater_than: 0, is_less_than: 2147483647
end
