class Manifest < ApplicationRecord
  belongs_to :manufacture
  belongs_to :product

  validates_presence_of :quantity
  validates_numericality_of :quantity, greater_than_or_equal_to: 1
end
