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

class Catalog < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  validates_presence_of :title
  validates_length_of :title, :within => 6..60

  validates_presence_of :description
end
