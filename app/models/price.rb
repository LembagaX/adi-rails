# == Schema Information
#
# Table name: prices
#
#  id          :bigint(8)        not null, primary key
#  amount      :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  material_id :bigint(8)
#  provider_id :bigint(8)
#

class Price < ApplicationRecord
  belongs_to :material
  belongs_to :provider

  validates_presence_of :amount
  validates_numericality_of :amount, greater_than: 0
end
