require 'rails_helper'

RSpec.describe "shop_beers/new", :type => :view do
  before(:each) do
    assign(:shop_beer, ShopBeer.new(
      :shop => nil,
      :beer => nil
    ))
  end

  it "renders new shop_beer form" do
    render

    assert_select "form[action=?][method=?]", shop_beers_path, "post" do

      assert_select "input#shop_beer_shop_id[name=?]", "shop_beer[shop_id]"

      assert_select "input#shop_beer_beer_id[name=?]", "shop_beer[beer_id]"
    end
  end
end
