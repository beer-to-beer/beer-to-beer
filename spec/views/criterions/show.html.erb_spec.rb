require 'rails_helper'

RSpec.describe "criterions/show", :type => :view do
  before(:each) do
    @criterion = assign(:criterion, Criterion.create!(
      :rating_id => 1,
      :name => "Name",
      :value => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/2/)
  end
end
