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

  after_create :sub_product, :sum_price
  before_create :unable_to_dup_product

  validates_presence_of :quantity
  validates_numericality_of :quantity, is_greater_than: 0, is_less_than: 2147483647

  def unit_price
    price / quantity
  end

  private

  def sub_product
    product.update stock: product.stock - quantity
  end

  def sum_price
    sum = product.price * quantity
    order.update price: order.price + sum
    update price: sum
  end

  def unable_to_dup_product
    if Order.find(order_id).product_exist? product_id
      throw :abort
    end
  end
end
