# == Schema Information
#
# Table name: purchases
#
#  id           :integer          not null, primary key
#  invoice      :string(150)
#  amount       :integer
#  note         :string(255)
#  purchased_at :datetime
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  provider_id  :integer
#  user_id      :integer
#

require 'rails_helper'

RSpec.describe Purchase, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
