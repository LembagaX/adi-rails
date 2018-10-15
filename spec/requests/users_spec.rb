require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /users" do
    it "works!" do
      get users_path format: :json
      expect(response).to have_http_status(200)
    end

    it '/generate' do
      user = create :user
      get users_generate_path format: :json, params: { user: { email: user.email, password: user.password } }
      expect(response).to have_http_status(200)
    end
  end
end
