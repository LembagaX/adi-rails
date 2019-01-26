require 'rails_helper'

RSpec.describe "Depreciations", type: :request do
  describe "GET /depreciations" do
    it "works! (now write some real specs)" do
      get depreciations_path
      expect(response).to have_http_status(200)
    end
  end
end
