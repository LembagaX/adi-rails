# == Schema Information
#
# Table name: announcements
#
#  id         :bigint(8)        not null, primary key
#  message    :string
#  due        :date
#  color      :integer
#  user_id    :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Announcement, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
