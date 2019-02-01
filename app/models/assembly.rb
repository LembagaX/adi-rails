# == Schema Information
#
# Table name: assemblies
#
#  id          :integer          not null, primary key
#  product_id  :integer
#  material_id :integer
#  quantity    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Assembly < ApplicationRecord
  belongs_to :product
  belongs_to :material
  
  validates_presence_of :quantity
  validates_numericality_of :quantity, greater_than_or_equal_to: 0
end