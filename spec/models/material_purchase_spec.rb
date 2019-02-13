# == Schema Information
#
# Table name: material_purchases
#
#  id          :bigint(8)        not null, primary key
#  material_id :bigint(8)
#  purchase_id :bigint(8)
#  price       :integer
#  quantity    :integer
#

require 'rails_helper'

RSpec.describe MaterialPurchase, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
