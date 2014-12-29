require 'rails_helper'

RSpec.describe "shop_beers/edit", :type => :view do
  before(:each) do
    @shop_beer = assign(:shop_beer, ShopBeer.create!(
      :shop => nil,
      :beer => nil
    ))
  end

  it "renders the edit shop_beer form" do
    render

    assert_select "form[action=?][method=?]", shop_beer_path(@shop_beer), "post" do

      assert_select "input#shop_beer_shop_id[name=?]", "shop_beer[shop_id]"

      assert_select "input#shop_beer_beer_id[name=?]", "shop_beer[beer_id]"
    end
  end
end
