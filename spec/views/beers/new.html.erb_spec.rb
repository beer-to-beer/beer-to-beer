require 'rails_helper'

RSpec.describe "beers/new", :type => :view do
  before(:each) do
    assign(:beer, Beer.new(
      :title => "MyString"
    ))
  end

  it "renders new beer form" do
    render

    assert_select "form[action=?][method=?]", beers_path, "post" do

      assert_select "input#beer_title[name=?]", "beer[title]"
    end
  end
end
