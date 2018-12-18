require 'rails_helper'

RSpec.describe "Users", type: :request do

  setup do
    create :role
  end

  describe "GET /users" do
    it "works!" do
      get users_path format: :json
      expect(response).to have_http_status :success
    end

    it '/token' do
      user = create :user
      post token_users_path format: :json, params: { user: { email: user.email, password: user.password, role_id: 1 } }
      expect(response).to have_http_status :success
    end
  end
end
