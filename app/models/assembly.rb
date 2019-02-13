# == Schema Information
#
# Table name: assemblies
#
#  id          :bigint(8)        not null, primary key
#  product_id  :bigint(8)
#  material_id :bigint(8)
#  quantity    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Assembly < ApplicationRecord
  belongs_to :product
  belongs_to :material
  after_create :resum_assembly
  
  validates_presence_of :quantity
  validates_numericality_of :quantity, greater_than_or_equal_to: 0
  
  private
  def resum_assembly
    current = product.assemblies.where(material_id: material_id)
    if current.count > 1
      current.update(quantity: current.sum(:quantity))
      current.reload
      current.last.destroy
    end
  end  
end
