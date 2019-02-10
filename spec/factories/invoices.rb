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
#  order_id    :integer
#

FactoryBot.define do
  factory :invoice do
    number { "MyString" }
    termin { "MyString" }
    currency { nil }
  end
end
