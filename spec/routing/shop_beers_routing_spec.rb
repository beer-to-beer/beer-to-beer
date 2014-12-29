require "rails_helper"

RSpec.describe ShopBeersController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/shop_beers").to route_to("shop_beers#index")
    end

    it "routes to #new" do
      expect(:get => "/shop_beers/new").to route_to("shop_beers#new")
    end

    it "routes to #show" do
      expect(:get => "/shop_beers/1").to route_to("shop_beers#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/shop_beers/1/edit").to route_to("shop_beers#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/shop_beers").to route_to("shop_beers#create")
    end

    it "routes to #update" do
      expect(:put => "/shop_beers/1").to route_to("shop_beers#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/shop_beers/1").to route_to("shop_beers#destroy", :id => "1")
    end

  end
end
