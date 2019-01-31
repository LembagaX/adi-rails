# == Schema Information
#
# Table name: material_purchases
#
#  id          :integer          not null, primary key
#  material_id :integer
#  purchase_id :integer
#  price       :integer
#  quantity    :integer
#

require 'rails_helper'

RSpec.describe MaterialPurchase, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
