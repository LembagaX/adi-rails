# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string(60)
#  slug       :string(60)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Category < ApplicationRecord
    extend FriendlyId
    friendly_id :name, use: :slugged

    validates_presence_of :name
    validates_length_of :name, within: 6...50

    has_many :products, dependent: :destroy
end
