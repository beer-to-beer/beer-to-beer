require 'rails_helper'

RSpec.describe "beers/show", :type => :view do
  before(:each) do
    @beer = assign(:beer, Beer.create!(
      :title => "Title"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
  end
end
