require 'rails_helper'

RSpec.describe "ratings/new", :type => :view do
  before(:each) do
    assign(:rating, Rating.new(
      :beer_id => 1,
      :user_id => 1,
      :comment => "MyText"
    ))
  end

  it "renders new rating form" do
    render

    assert_select "form[action=?][method=?]", ratings_path, "post" do

      assert_select "input#rating_beer_id[name=?]", "rating[beer_id]"

      assert_select "input#rating_user_id[name=?]", "rating[user_id]"

      assert_select "textarea#rating_comment[name=?]", "rating[comment]"
    end
  end
end
