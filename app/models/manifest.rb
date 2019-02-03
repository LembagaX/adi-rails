class Manifest < ApplicationRecord
  before_destroy :sub_product_stock

  belongs_to :manufacture
  belongs_to :product

  validates_presence_of :quantity
  validates_numericality_of :quantity, greater_than_or_equal_to: 1

  def sub_product_stock number
    product = self.product
    product.update stock: product.stock - number
  end

  def add_product_stock number
    product = self.product
    product.update stock: product.stock + number
  end
end
