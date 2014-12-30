require 'rails_helper'

RSpec.describe "criterions/edit", :type => :view do
  before(:each) do
    @criterion = assign(:criterion, Criterion.create!(
      :rating_id => 1,
      :name => "MyString",
      :value => 1
    ))
  end

  it "renders the edit criterion form" do
    render

    assert_select "form[action=?][method=?]", criterion_path(@criterion), "post" do

      assert_select "input#criterion_rating_id[name=?]", "criterion[rating_id]"

      assert_select "input#criterion_name[name=?]", "criterion[name]"

      assert_select "input#criterion_value[name=?]", "criterion[value]"
    end
  end
end
