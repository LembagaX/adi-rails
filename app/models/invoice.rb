# == Schema Information
#
# Table name: invoices
#
#  id          :integer          not null, primary key
#  number      :string(16)
#  termin      :integer
#  currency_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Invoice < ApplicationRecord
  enum termin: { "Tunai": 0, "30 Hari": 1, "60 Hari": 2, "90 Hari": 3 }
  belongs_to :currency
  before_create :build_number

  validates_presence_of :termin

  private
  def build_number
    first   = Time.current.strftime '%d%m%Y'
    mans    = Invoice.last ? Invoice.last.id : 0
    offset  = '0' * (6 - mans.to_s.length)
    role    = '03'
    self.number = first + offset + (mans + 1).to_s + role
  end
end
