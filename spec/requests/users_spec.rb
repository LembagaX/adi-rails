require 'rails_helper'

RSpec.describe "Users", type: :request do

  setup do
    create :role
  end

  describe "users" do
    it "#index" do
      user = create :user, password: 'secret'
      headers = {
        "token"  => "#{user.generate_token('secret')}"
      }

      get users_path(format: :json), :headers => headers
      expect(response.content_type).to eq("application/json")
      expect(response).to have_http_status 200
    end

    it '#create' do
      user = create :user, password: 'secret'
      post '/users', params: { user: { email: FFaker::Internet.email, name: FFaker::Name.name, password: 'secret' }, token: user.generate_token('secret') }
    end

    it '#show' do
      user = create :user, password: 'secret'
      headers = {
        "token"  => "#{user.generate_token('secret')}"
      }
      get users_path(user.to_param, format: :json), headers: headers
    end

    it '#token' do
      user = create :user
      post token_users_path format: :json, params: { user: { email: user.email, password: user.password, role_id: 1 } }
      expect(response).to have_http_status :success
    end

    it '#destroy' do
      user = create :user, password: 'secret'
      dest = create :user
      headers = {
        "token"  => "#{user.generate_token('secret')}"
      }
      delete user_path(dest.to_param, format: :json), headers: headers
      expect(response).to have_http_status 200
    end
  end
end
