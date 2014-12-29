require 'rails_helper'

RSpec.describe "shop_beers/index", :type => :view do
  before(:each) do
    assign(:shop_beers, [
      ShopBeer.create!(
        :shop => nil,
        :beer => nil
      ),
      ShopBeer.create!(
        :shop => nil,
        :beer => nil
      )
    ])
  end

  it "renders a list of shop_beers" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
