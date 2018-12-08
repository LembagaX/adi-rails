require 'rails_helper'
RSpec.describe PartsController, type: :controller do
  setup do
    @user = create :user, password: 'secret'
    @token = @user.generate_token 'secret'
    request.headers.merge! token: @token
  end

  describe "GET #index" do
    it "returns a success response" do
      get :index, format: :json
      expect(response).to have_http_status :ok
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      part = create :part
      get :show, params: {id: part.to_param}, format: :json
      expect(response).to have_http_status :ok
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Part" do
        expect {
          post :create, params: { part: attributes_for(:part) }, format: :json
        }.to change(Part, :count).by(1)
      end

      it "renders a JSON response with the new part" do
        post :create, params: { part: attributes_for(:part) }, format: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
        expect(response.location).to eq(part_url(Part.last))
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the new part" do
        post :create, params: { part: attributes_for(:part, name: nil) }, format: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { name: 'New Attributes' }
      }

      it "updates the requested part" do
        part = create :part
        put :update, params: { id: part.to_param, part: new_attributes}, format: :json
        part.reload
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
      end

      it "renders a JSON response with the part" do
        part = create :part
        put :update, params: {id: part.to_param, part: attributes_for(:part) }, format: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the part" do
        part = create :part
        put :update, params: {id: part.to_param, part: attributes_for(:part, name: nil) }, format: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested part" do
      part = create :part
      expect {
        delete :destroy, params: {id: part.to_param}, format: :json
      }.to change(Part, :count).by(-1)
    end
  end
end
