# == Schema Information
#
# Table name: providers
#
#  id         :integer          not null, primary key
#  name       :string(120)
#  slug       :string(120)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Provider < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_and_belongs_to_many :materials
  has_many :prices, dependent: :destroy
  has_many :purchases, dependent: :destroy
  has_many :depreciations, dependent: :destroy

  validates_presence_of :name
  validates_length_of :name, :within => 6..120
end
