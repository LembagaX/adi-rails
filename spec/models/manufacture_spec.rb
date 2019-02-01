# == Schema Information
#
# Table name: manufactures
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  code       :string(16)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Manufacture, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
