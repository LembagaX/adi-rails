# == Schema Information
#
# Table name: sales_invoices
#
#  id         :bigint(8)        not null, primary key
#  ship_date  :date
#  number     :string(13)
#  order_id   :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :sales_invoice do
    ship_date { "2019-02-17" }
    number { "MyString" }
    order { nil }
  end
end
