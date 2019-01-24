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

  has_many :prices, dependent: :destroy
  has_many :material_purchases, dependent: :destroy
  has_many :purchases, through: :material_purchases, dependent: :destroy
  has_and_belongs_to_many :providers, dependent: :destroy

  validates_presence_of :name
  validates_length_of :name, :within => 6..120

  validates_presence_of :stock
  validates_numericality_of :stock, greater_than: 0

  alias purchase_history material_purchases

  def price
    prices.order(created_at: :desc).first ? prices.order(created_at: :desc).first.amount : 0
  end

  def restock stock
    self.update stock: (self.stock + stock)    
  end

  def log_price price, provider
    if self.price != price
      self.prices.create amount: price, provider_id: provider
    end        
  end
  
end
