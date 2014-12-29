require 'rails_helper'

RSpec.describe "beers/edit", :type => :view do
  before(:each) do
    @beer = assign(:beer, Beer.create!(
      :title => "MyString"
    ))
  end

  it "renders the edit beer form" do
    render

    assert_select "form[action=?][method=?]", beer_path(@beer), "post" do

      assert_select "input#beer_title[name=?]", "beer[title]"
    end
  end
end
