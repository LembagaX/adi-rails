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
#  discount   :integer          default(0)
#

class Order < ApplicationRecord
  belongs_to :user
  belongs_to :address
  has_one :customer, through: :address
  has_one :invoice, dependent: :destroy
  has_many :carts

  alias bill_to customer
  alias ship_to address

  before_validation :canceled_to_false, on: :create
  before_validation :set_number, on: :create

  validates_presence_of :price
  validates_numericality_of :price

  validates_presence_of :number
  validates_numericality_of :number

  def set_number
    last = Order.last.nil? ? 0 : Order.last.number
    self.number = "#{last + 1}"
  end

  def sub_total
    price
  end

  def total
    price - discount
  end

  private
  def canceled_to_false
    self.canceled = 0
  end
end
