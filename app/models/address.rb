# == Schema Information
#
# Table name: addresses
#
#  id          :bigint(8)        not null, primary key
#  address     :string(120)
#  customer_id :bigint(8)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Address < ApplicationRecord
  belongs_to :customer

  validates_presence_of :address
  validates_length_of :address, within: 6..120
end
