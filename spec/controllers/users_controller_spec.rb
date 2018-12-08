require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  setup do
    @user = create :user
  end

  describe "GET #generate" do
    it "returns http success" do
      post :generate, format: :json, params: { user: { email: @user.email, password: @user.password } }
      expect(response).to have_http_status :success
    end

    it "returns http 203 (email salah)" do
      post :generate, format: :json, params: { user: { email: 'wrong@email.fake', password: @user.password } }
      expect(response).to have_http_status 203
    end

    it "returns http 203 (password salah)" do
      post :generate, format: :json, params: { user: { email: @user.email, password: 'wrongpassword' } }
      expect(response).to have_http_status 203
    end
  end

  describe 'POST #create' do
    it 'success (200)' do
      new = attributes_for :user
      token = @user.generate_token @user.password
      post :create, format: :json, params: {
        user: new,
        token: token
      }
      expect(response).to have_http_status :ok
      expect(User.all.count).to eq 2
    end

    it 'token tidak valid (203)' do
      new = attributes_for :user
      token = @user.generate_token @user.password
      expect{
        post :create, format: :json, params: {
          user: new,
          token: token + 'invalidstring'
        }
      }.to raise_error JWT::VerificationError
      expect(User.all.count).to eq 1
    end

    it 'request tidak valid (422)' do
      token = @user.generate_token @user.password
      post :create, format: :json, params: {
        user: {
          name: ''
        },
        token: token
      }
      expect(response).to have_http_status 422
      expect(User.all.count).to eq 1
    end
  end

end
