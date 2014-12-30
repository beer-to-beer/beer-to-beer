require 'rails_helper'

RSpec.describe "criterions/new", :type => :view do
  before(:each) do
    assign(:criterion, Criterion.new(
      :rating_id => 1,
      :name => "MyString",
      :value => 1
    ))
  end

  it "renders new criterion form" do
    render

    assert_select "form[action=?][method=?]", criterions_path, "post" do

      assert_select "input#criterion_rating_id[name=?]", "criterion[rating_id]"

      assert_select "input#criterion_name[name=?]", "criterion[name]"

      assert_select "input#criterion_value[name=?]", "criterion[value]"
    end
  end
end
