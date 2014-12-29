require 'rails_helper'

RSpec.describe "ShopBeers", :type => :request do
  describe "GET /shop_beers" do
    it "works! (now write some real specs)" do
      get shop_beers_path
      expect(response).to have_http_status(200)
    end
  end
end
