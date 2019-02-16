# == Schema Information
#
# Table name: orders
#
#  id         :bigint(8)        not null, primary key
#  price      :integer
#  number     :integer
#  canceled   :boolean
#  user_id    :bigint(8)
#  address_id :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  discount   :integer          default(0)
#

require 'rails_helper'

RSpec.describe Order, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
