require 'rails_helper'

RSpec.describe "ratings/show", :type => :view do
  before(:each) do
    @rating = assign(:rating, Rating.create!(
      :beer_id => 1,
      :user_id => 2,
      :comment => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/MyText/)
  end
end
