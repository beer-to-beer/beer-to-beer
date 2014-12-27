require 'rails_helper'

RSpec.describe "shops/new", :type => :view do
  before(:each) do
    assign(:shop, Shop.new(
      :name => "MyString",
      :address_id => 1
    ))
  end

  it "renders new shop form" do
    render

    assert_select "form[action=?][method=?]", shops_path, "post" do

      assert_select "input#shop_name[name=?]", "shop[name]"

      assert_select "input#shop_address_id[name=?]", "shop[address_id]"
    end
  end
end
