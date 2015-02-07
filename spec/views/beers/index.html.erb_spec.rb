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

end
