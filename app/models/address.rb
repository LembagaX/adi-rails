# == Schema Information
#
# Table name: addresses
#
#  id          :integer          not null, primary key
#  address     :string(120)
#  customer_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Address < ApplicationRecord
  belongs_to :customer

  validates_presence_of :address
  validates_length_of :address, within: 6..120
end
