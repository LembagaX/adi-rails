# == Schema Information
#
# Table name: currencies
#
#  id         :integer          not null, primary key
#  code       :string(3)
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Currency < ApplicationRecord
  belongs_to :user
  has_many :invoices

  validates_presence_of :code
  validates_uniqueness_of :code
  validates_length_of :code, within: 3..3

  def to_param
    code
  end
  
end
