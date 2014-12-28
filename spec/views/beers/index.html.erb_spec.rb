require 'rails_helper'

RSpec.describe "beers/index", :type => :view do
  before(:each) do
    assign(:beers, [
      Beer.create!(
        :title => "Title"
      ),
      Beer.create!(
        :title => "Title"
      )
    ])
  end

  it "renders a list of beers" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
  end
end
