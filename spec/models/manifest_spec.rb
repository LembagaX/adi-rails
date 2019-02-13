# == Schema Information
#
# Table name: manifests
#
#  id             :bigint(8)        not null, primary key
#  manufacture_id :bigint(8)
#  product_id     :bigint(8)
#  quantity       :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'rails_helper'

RSpec.describe Manifest, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
