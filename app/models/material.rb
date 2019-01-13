# == Schema Information
#
# Table name: materials
#
#  id         :integer          not null, primary key
#  name       :string(120)
#  slug       :string(120)
#  stock      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Material < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :prices

  validates_presence_of :name
  validates_length_of :name, :within => 6..120

  validates_presence_of :stock
  validates_numericality_of :stock, greater_than: 0

  def price
    prices.order(created_at: :desc).first
  end
end
