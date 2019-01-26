require "rails_helper"

RSpec.describe DepreciationsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/depreciations").to route_to("depreciations#index")
    end

    it "routes to #show" do
      expect(:get => "/depreciations/1").to route_to("depreciations#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/depreciations").to route_to("depreciations#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/depreciations/1").to route_to("depreciations#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/depreciations/1").to route_to("depreciations#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/depreciations/1").to route_to("depreciations#destroy", :id => "1")
    end
  end
end
