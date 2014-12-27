require 'rails_helper'

RSpec.describe "shops/edit", :type => :view do
  before(:each) do
    @shop = assign(:shop, Shop.create!(
      :name => "MyString",
      :address_id => 1
    ))
  end

  it "renders the edit shop form" do
    render

    assert_select "form[action=?][method=?]", shop_path(@shop), "post" do

      assert_select "input#shop_name[name=?]", "shop[name]"

      assert_select "input#shop_address_id[name=?]", "shop[address_id]"
    end
  end
end
