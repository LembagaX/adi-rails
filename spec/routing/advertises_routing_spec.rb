require "rails_helper"

RSpec.describe AdvertisesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/advertises").to route_to("advertises#index")
    end

    it "routes to #show" do
      expect(:get => "/advertises/1").to route_to("advertises#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/advertises").to route_to("advertises#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/advertises/1").to route_to("advertises#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/advertises/1").to route_to("advertises#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/advertises/1").to route_to("advertises#destroy", :id => "1")
    end
  end
end
