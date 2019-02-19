# == Schema Information
#
# Table name: sales_invoices
#
#  id         :bigint(8)        not null, primary key
#  number     :string(13)
#  order_id   :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  due        :date
#

class SalesInvoice < ApplicationRecord
  belongs_to :order
  before_create :generate_number

  private
  def generate_number
    begin
      random = rand(9999)
      roman = to_roman(created_at.strftime('%-m'))
      year = created_at.strftime '%Y'
      number = "#{random}/#{roman}/#{year}"
      self.number = number
    end until SalesInvoice.find_by_number(number).nil?
  end

  def to_roman param
    result = ""
    number = param.to_i
    roman_mapping.keys.each do |divisor|
      quotient, modulus = number.divmod(divisor)
      result << roman_mapping[divisor] * quotient
      number = modulus
    end
    result
  end

  def roman_mapping
    {
      1000 => "M",
      900 => "CM",
      500 => "D",
      400 => "CD",
      100 => "C",
      90 => "XC",
      50 => "L",
      40 => "XL",
      10 => "X",
      9 => "IX",
      5 => "V",
      4 => "IV",
      1 => "I"
    }
  end
end
