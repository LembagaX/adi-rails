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

class User < ApplicationRecord
  has_secure_password
  validates_presence_of :name
  validates_length_of :name, :within => 6..45

  validates_presence_of :email
  validates_length_of :email, :within => 6..45

  validates_length_of :password, :within => 6..72

  validates_uniqueness_of :email

  def generate_token password
    if authenticate password
      payload = { user: self.as_json }
      JWT.encode payload, Figaro.env.jwt_secret, Figaro.env.jwt_algorithm
    end
  end

  def User.valid_token? token
    response = true
    begin
      JWT.decode token, Figaro.env.jwt_secret, Figaro.env.jwt_algorithm
    rescue JWT::VerificationError
      response = false
    end
    response
  end
end
