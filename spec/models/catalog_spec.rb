# == Schema Information
#
# Table name: catalogs
#
#  id          :bigint(8)        not null, primary key
#  title       :string
#  slug        :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe Catalog, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
