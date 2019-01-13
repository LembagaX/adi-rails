# == Schema Information
#
# Table name: roles
#
#  id           :integer          not null, primary key
#  name         :string(20)
#  display_name :string(20)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Role < ApplicationRecord
  extend FriendlyId
  friendly_id :display_name, use: :slugged, slug_column: :name

  validates_presence_of :name
  validates_uniqueness_of :name
  validates_length_of :name, :within => 3..20

  validates_presence_of :display_name
  validates_length_of :display_name, :within => 3..20

  has_many :users
  
  def users_count
    self.users.count
  end
  
end
