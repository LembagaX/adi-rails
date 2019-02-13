# == Schema Information
#
# Table name: products
#
#  id            :bigint(8)        not null, primary key
#  code          :string(10)
#  name          :string(60)
#  serial_number :string(15)
#  price         :integer
#  category_id   :bigint(8)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  stock         :integer
#

require 'rails_helper'

RSpec.describe Product, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
