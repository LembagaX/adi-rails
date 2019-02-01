# == Schema Information
#
# Table name: products
#
#  id            :integer          not null, primary key
#  code          :string(10)
#  name          :string(60)
#  serial_number :string(15)
#  price         :integer
#  category_id   :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Product < ApplicationRecord
  belongs_to :category, optional: true
  before_save :attach_category

  has_many :assemblies, dependent: :destroy
  has_many :materials, through: :assemblies
  
  validates_presence_of :code
  validates_length_of :code, within: 4..10
  validates_uniqueness_of :code

  validates_presence_of :name
  validates_length_of :name, within: 4..60

  validates_presence_of :serial_number
  validates_length_of :serial_number, within: 5..15

  validates_numericality_of :price, greater_than_or_equal_to: 0

  private
  def attach_category
    if self.category_id == nil
      self.category = Category.friendly.find 'uncategorized'
    end
  end
  
end