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

require 'rails_helper'

RSpec.describe Invoice, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
