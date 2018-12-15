require 'rails_helper'

RSpec.describe "Parts", type: :request do
  setup do
    create :role
    @user = create :user, password: 'secret'
    @token = @user.generate_token 'secret'
  end

  describe "GET /parts.json" do
    it "return 200" do
      get '/parts.json', headers: { token: @token }
      expect(response).to have_http_status :ok
    end
  end

  describe 'POST /parts.json' do
    it "return created if valid" do
      post '/parts.json', params: { part: attributes_for(:part) }, headers: { token: @token }
      expect(response).to have_http_status :created
    end

    it 'return oke if not valid' do
      post '/parts.json' , params: { part: attributes_for(:part, name: nil) }, headers: { token: @token }
      expect(response).to have_http_status :unprocessable_entity
    end
  end

  describe 'GET /parts/:id.json' do
    it 'return ok' do
      part = create :part
      get "/parts/#{part.to_param}.json", headers: { token: @token }
      expect(response).to have_http_status :ok
    end
  end

  describe 'PUT /parts/:id.json' do
    it 'return ok' do
      part = create :part
      put "/parts/#{part.to_param}.json", params: { part: attributes_for(:part) }, headers: { token: @token }
      expect(response).to have_http_status :ok
    end

    it 'return unprocessable_entity' do
      part = create :part
      put "/parts/#{part.to_param}.json", params: { part: attributes_for(:part, name: nil) }, headers: { token: @token }
      expect(response).to have_http_status :unprocessable_entity
    end
  end

  describe 'Patch /parts/:id.json' do
    it 'return ok' do
      part = create :part
      patch "/parts/#{part.to_param}.json", params: { part: attributes_for(:part) }, headers: { token: @token }
      expect(response).to have_http_status :ok
    end

    it 'return unprocessable_entity' do
      part = create :part
      patch "/parts/#{part.to_param}.json", params: { part: attributes_for(:part, name: nil) }, headers: { token: @token }
      expect(response).to have_http_status :unprocessable_entity
    end
  end

  describe 'DELETE /part/:id.json' do
    it 'return no_content' do
      part = create :part
      delete "/parts/#{part.to_param}.json", headers: { token: @token }
      expect(response).to have_http_status :no_content
    end
  end
end
