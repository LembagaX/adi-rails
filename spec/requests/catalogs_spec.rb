require 'rails_helper'

RSpec.describe "Catalogs", type: :request do
  describe "GET /catalogs" do
    it "works! (now write some real specs)" do
      get catalogs_path
      expect(response).to have_http_status(200)
    end
  end
end
