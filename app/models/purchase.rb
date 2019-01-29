# == Schema Information
#
# Table name: purchases
#
#  id           :integer          not null, primary key
#  invoice      :string(150)
#  amount       :integer
#  note         :string(255)
#  purchased_at :datetime
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Purchase < ApplicationRecord
  belongs_to :provider
  belongs_to :user
  has_and_belongs_to_many :materials, dependent: :destroy
  has_many :material_purchases, dependent: :destroy

  validates_presence_of :invoice
  validates_length_of :invoice, :within => 6..150

  validates_presence_of :amount
  validates_numericality_of :amount, greater_than: 0

  validates :note, length: { maximum: 255 }

  validates_presence_of :purchased_at
end
