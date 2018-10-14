require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #generate" do
    it "returns http success" do
      user = create :user
      post :generate, format: :json, params: { user: { email: user.email, password: user.password } }
      expect(response).to have_http_status :success
    end

    it "returns http 203 (email salah)" do
      user = create :user
      post :generate, format: :json, params: { user: { email: 'wrong@email.fake', password: user.password } }
      expect(response).to have_http_status 203
    end

    it "returns http 203 (password salah)" do
      user = create :user
      post :generate, format: :json, params: { user: { email: user.email, password: 'wrongpassword' } }
      expect(response).to have_http_status 203
    end
  end

end
