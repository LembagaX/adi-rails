# == Schema Information
#
# Table name: manufactures
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  code       :string(16)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Manufacture < ApplicationRecord
  before_create :build_code
  belongs_to :user
  has_many :manifests, dependent: :destroy
  has_many :products, through: :manifests

  validates_uniqueness_of :code

  def build_code
    first   = Time.current.strftime '%d%m%Y'
    mans    = Manufacture.last.id
    offset  = '0' * (6 - mans.to_s.length)
    role    = '02'
    self.code = first + offset + (mans + 1).to_s + role
  end

  def products_created
    self.manifests.sum :quantity
  end

  private
  def save_code
    self.code = self.friendly_id
  end
end
