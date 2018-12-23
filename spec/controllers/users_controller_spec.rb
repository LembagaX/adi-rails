require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  setup do
    create :role
    @user = create :user
  end

  describe "GET #index" do
    it 'return 200' do
      user = create :user, password: 'secret'
      request.headers.merge!({ token: user.generate_token('secret') })
      get :index, format: :json
      expect(response).to render_template :index
      expect(response).to have_http_status 200
    end

    it 'return 203 without token header' do
      get :index, format: :json
      expect(response).to have_http_status 203
    end
  end

  describe "GET #show" do
    it 'return 200' do
      user = create :user, password: 'secret'
      request.headers.merge!({ token: user.generate_token('secret') })
      get :show, format: :json, params: { id: user.to_param }
      expect(response).to render_template :show
      expect(response).to have_http_status 200
    end

    it 'return 203 token null' do
      user = create :user, password: 'secret'
      get :show, format: :json, params: { id: user.to_param }
      expect(response).to have_http_status 203
    end
  end


  describe "DELETE #destroy" do
    it "destroys the requested user" do
      user    = create :user, password: 'secret'
      deleted = create :user, password: 'secret'
      request.headers.merge!({ token: user.generate_token('secret') })
      expect {
        delete :destroy, params: {id: deleted.to_param}, format: :json
      }.to change(User, :count).by(-1)
      expect(response).to have_http_status 200
    end

    it 'return 200' do
      deleted = create :user, password: 'secret'
      delete :destroy, params: {id: deleted.to_param}, format: :json
      expect(response).to have_http_status 203
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {
          name: FFaker::Name.name,
          password: 'secret'
        }
      }

      it "updates the requested user" do
        user    = create :user, password: 'secret'
        old     = user.name
        request.headers.merge!({ token: user.generate_token('secret') })
        put :update, params: { id: user.to_param, user: new_attributes}, format: :json
        user.reload
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
        expect(user.name).not_to eq old
        expect(response).to render_template :show
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the user" do
        user = create :user, password: 'secret'
        request.headers.merge!({ token: user.generate_token('secret') })
        put :update, params: {id: user.to_param, user: attributes_for(:user, name: nil) }, format: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe "GET #token" do
    it "returns http success" do
      post :token, format: :json, params: { user: { email: @user.email, password: @user.password } }
      expect(response).to have_http_status :success
    end

    it "returns http 203 (email salah)" do
      post :token, format: :json, params: { user: { email: 'wrong@email.fake', password: @user.password } }
      expect(response).to have_http_status 203
    end

    it "returns http 203 (password salah)" do
      post :token, format: :json, params: { user: { email: @user.email, password: 'wrongpassword' } }
      expect(response).to have_http_status 203
    end
  end

  describe 'POST #create' do
    it 'success (200)' do
      new = attributes_for :user
      token = @user.generate_token @user.password
      post :create, format: :json, params: {
        user: new,
        token: token,
        role_id: 1
      }
      expect(response).to have_http_status :ok
      expect(User.all.count).to eq 2
    end

    it 'failed 203' do
      Role.create display_name: 'Another Role'
      new = attributes_for :user, role_id: Role.last.id
      @user.update role_id: Role.last.id
      token = @user.generate_token @user.password
      post :create, format: :json, params: {
        user: new,
        token: token,
        role_id: 1
      }
      expect(response).to have_http_status :non_authoritative_information
      expect(User.all.count).to eq 1
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
