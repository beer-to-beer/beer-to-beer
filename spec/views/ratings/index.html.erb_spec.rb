require 'rails_helper'

RSpec.describe "ratings/index", :type => :view do
  before(:each) do
    assign(:ratings, [
      Rating.create!(
        :beer_id => 1,
        :user_id => 2,
        :comment => "MyText"
      ),
      Rating.create!(
        :beer_id => 1,
        :user_id => 2,
        :comment => "MyText"
      )
    ])
  end

  it "renders a list of ratings" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
