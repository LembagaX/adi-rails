class Manifest < ApplicationRecord
  before_destroy :touch_product
  after_create :add_product_stock
  before_update :sub_product_stock

  belongs_to :manufacture
  belongs_to :product

  validates_presence_of :quantity
  validates_numericality_of :quantity, greater_than_or_equal_to: 1

  def sub_product_stock
    product = self.product
    product.update stock: product.stock - (self.quantity_was - self.quantity)
  end

  def add_product_stock
    product = self.product
    product.update! stock: product.stock + self.quantity
  end

  private
  def touch_product
    self.sub_product_stock self.quantity
  end
end
