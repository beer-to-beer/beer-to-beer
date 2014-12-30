require 'rails_helper'

RSpec.describe "ratings/edit", :type => :view do
  before(:each) do
    @rating = assign(:rating, Rating.create!(
      :beer_id => 1,
      :user_id => 1,
      :comment => "MyText"
    ))
  end

  it "renders the edit rating form" do
    render

    assert_select "form[action=?][method=?]", rating_path(@rating), "post" do

      assert_select "input#rating_beer_id[name=?]", "rating[beer_id]"

      assert_select "input#rating_user_id[name=?]", "rating[user_id]"

      assert_select "textarea#rating_comment[name=?]", "rating[comment]"
    end
  end
end
