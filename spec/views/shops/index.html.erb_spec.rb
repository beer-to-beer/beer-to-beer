require 'rails_helper'

RSpec.describe "shops/index", :type => :view do
  before(:each) do
    assign(:shops, [
      Shop.create!(
        :name => "Name",
        :address_id => 1
      ),
      Shop.create!(
        :name => "Name",
        :address_id => 1
      )
    ])
  end

  it "renders a list of shops" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
