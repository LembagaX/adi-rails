# == Schema Information
#
# Table name: categories
#
#  id         :bigint(8)        not null, primary key
#  name       :string(60)
#  slug       :string(60)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Category < ApplicationRecord
    extend FriendlyId
    friendly_id :name, use: :slugged
    before_destroy :destroyable

    validates_presence_of :name
    validates_length_of :name, within: 6...50

    has_many :products, dependent: :destroy

    private
    def destroyable
      if self.products.count != 0
        throw :abort
      end
    end
end
