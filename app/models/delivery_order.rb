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

class DeliveryOrder < ApplicationRecord
  belongs_to :order

  before_create :generate_order_number

  private
  def generate_order_number
    begin
      random_number = rand(9999999)
      self.number = random_number
    end until Order.find_by_number(random_number).nil?
  end
end
