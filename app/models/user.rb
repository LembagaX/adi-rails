# == Schema Information
#
# Table name: users
#
#  id              :bigint(8)        not null, primary key
#  name            :string(45)
#  email           :string(45)
#  password_digest :string(72)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  secret          :string(60)
#  role_id         :bigint(8)
#

class User < ApplicationRecord
  before_save :update_secret
  before_destroy :destroyable

  has_secure_password
  validates_presence_of :name
  validates_length_of :name, :within => 6..45

  validates_presence_of :email
  validates_length_of :email, :within => 6..45

  validates_length_of :password, :within => 6..72

  validates_uniqueness_of :email

  belongs_to :role
  has_many :purchases, dependent: :destroy
  has_many :depreciations, dependent: :destroy
  has_many :manufactures
  has_many :currencies

  def generate_token password
    if authenticate password
      self.update password: password
      payload = { user: self.as_json }
      JWT.encode payload, Figaro.env.jwt_secret, Figaro.env.jwt_algorithm
    end
  end

  def active_token? token
    payload = JWT.decode token, Figaro.env.jwt_secret, Figaro.env.jwt_algorithm
    payload[0]['user']['secret'] == self.secret
  end

  def update_secret
    self.secret = BCrypt::Password.create(self.email)
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

  def User.find_by_token token
    payload = JWT.decode token, Figaro.env.jwt_secret, Figaro.env.jwt_algorithm
    User.find_by_email payload[0]['user']['email']
  end

  def is_admin?
    self.role.name == 'administrator'
  end

  def has_role? params
    self.role.name == params
  end

  def destroyable
    if self.manufactures.count != 0
      throw :abort
    end
    
  end
  
end
