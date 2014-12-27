require 'rails_helper'

RSpec.describe "shops/show", :type => :view do
  before(:each) do
    @shop = assign(:shop, Shop.create!(
      :name => "Name",
      :address_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/1/)
  end
end
