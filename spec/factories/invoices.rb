# == Schema Information
#
# Table name: invoices
#
#  id          :bigint(8)        not null, primary key
#  number      :string(16)
#  termin      :integer
#  currency_id :bigint(8)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  order_id    :bigint(8)
#

FactoryBot.define do
  factory :invoice do
    number { "MyString" }
    termin { "MyString" }
    currency { nil }
  end
end
