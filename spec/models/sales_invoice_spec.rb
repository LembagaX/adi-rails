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

require 'rails_helper'

RSpec.describe SalesInvoice, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
