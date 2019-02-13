# == Schema Information
#
# Table name: currencies
#
#  id         :bigint(8)        not null, primary key
#  code       :string(3)
#  user_id    :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Currency, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
