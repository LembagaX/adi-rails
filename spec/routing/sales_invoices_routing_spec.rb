require "rails_helper"

RSpec.describe SalesInvoicesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/sales_invoices").to route_to("sales_invoices#index")
    end

    it "routes to #show" do
      expect(:get => "/sales_invoices/1").to route_to("sales_invoices#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/sales_invoices").to route_to("sales_invoices#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/sales_invoices/1").to route_to("sales_invoices#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/sales_invoices/1").to route_to("sales_invoices#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/sales_invoices/1").to route_to("sales_invoices#destroy", :id => "1")
    end
  end
end
