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

require 'rails_helper'

RSpec.describe Role, type: :model do
  describe 'validasi' do
    it { should validate_presence_of :name }
    it { should validate_uniqueness_of :name }
    it { should validate_length_of(:name).is_at_least(3).is_at_most(20) }

    it { should validate_presence_of :display_name }
    it { should validate_length_of(:display_name).is_at_least(3).is_at_most(20) }
  end

  describe 'relasi' do
    it { should have_many :users }
  end

  describe 'method test' do
    it 'is_admin?' do
      create :role
      create :user
      expect(User.first.is_admin?).to be true
    end

    it 'has_role? params' do
      create :role
      create :user
      expect(User.first.has_role? 'administrator').to be true
      expect(User.first.has_role? 'non-exist-role').to be false
    end
  end
end
