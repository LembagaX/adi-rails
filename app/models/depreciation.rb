# == Schema Information
#
# Table name: depreciations
#
#  id          :integer          not null, primary key
#  note        :string(255)
#  amount      :integer
#  quantity    :integer
#  provider_id :integer
#  material_id :integer
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Depreciation < ApplicationRecord
  belongs_to :provider
  belongs_to :material
  belongs_to :user

  validates_presence_of :note
  validates_length_of :note, within: 6...255

  validates_presence_of :amount
  validates_numericality_of :amount, greater_than_or_equal_to: 1

  validates_presence_of :quantity
  validates_numericality_of :quantity, greater_than_or_equal_to: 1
end
