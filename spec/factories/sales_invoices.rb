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

FactoryBot.define do
  factory :sales_invoice do
    ship_date { "2019-02-17" }
    number { "MyString" }
    order { nil }
  end
end
