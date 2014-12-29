require 'rails_helper'

RSpec.describe "shop_beers/show", :type => :view do
  before(:each) do
    @shop_beer = assign(:shop_beer, ShopBeer.create!(
      :shop => nil,
      :beer => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
