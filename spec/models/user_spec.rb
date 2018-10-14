# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(45)
#  email           :string(45)
#  password_digest :string(72)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:create_user) {
    @user = create :user, password: 'secret'
  }

  describe 'validasi' do
    describe 'name' do
      it { should validate_presence_of :name }
      it { should validate_length_of(:name).is_at_least(6).is_at_most(45) }
    end

    describe "email" do
      it { should validate_presence_of :email }
      it { should validate_length_of(:email).is_at_least(6).is_at_most(45) }
    end

    describe "password" do
      it { should validate_presence_of :password }
      it { should validate_length_of(:password).is_at_least(6).is_at_most(72) }
    end
  end

  it 'generate token' do
    create_user
    token = @user.generate_token 'secret'
    expect {
      JWT.decode(token, Figaro.env.jwt_secret, Figaro.env.jwt_algorithm)
    }.not_to raise_error

    expect {
      JWT.decode(token, 'whateversecret', Figaro.env.jwt_algorithm)
    }.to raise_error JWT::VerificationError
  end

  it 'valid token?' do
    create_user
    token = @user.generate_token 'secret'
    false_token = token.dup + "whatever"
    expect(User.valid_token?(token)).to be true
    expect(User.valid_token?(false_token)).to be false
  end
end
