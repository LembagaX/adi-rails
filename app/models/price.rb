# == Schema Information
#
# Table name: prices
#
#  id          :integer          not null, primary key
#  amount      :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  material_id :integer
#  provider_id :integer
#

class Price < ApplicationRecord
  belongs_to :material
  belongs_to :provider

  validates_presence_of :amount
  validates_numericality_of :amount, greater_than: 0
end
