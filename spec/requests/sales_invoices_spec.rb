require 'rails_helper'

RSpec.describe "SalesInvoices", type: :request do
  describe "GET /sales_invoices" do
    it "works! (now write some real specs)" do
      get sales_invoices_path
      expect(response).to have_http_status(200)
    end
  end
end
