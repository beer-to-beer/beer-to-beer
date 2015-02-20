require 'rails_helper'

describe 'Beers' do
  it 'can be created' do
    user = sign_in_user
    producer = FactoryGirl.create(:producer)
    category = FactoryGirl.create(:category)

    visit "/beers/new"
    fill_form(:beer, {title: 'myBeer'})
    fill_form(:producer, {name: producer.name})
    fill_form(:category, {name: category.name})


    expect { click_button 'Create Beer' }.to change { Beer.count }.by(1)
    expect(page).to have_content 'myBeer'
    expect(page).to have_content producer.name
    expect(page).to have_content category.name

  end

  it 'can be edited' do
    user = sign_in_user
    beer1 = FactoryGirl.create(:beer)
    beer2 = FactoryGirl.create(:beer)
    address = FactoryGirl.create(:address)
    shop = FactoryGirl.create(:shop,user: user)


    visit shop_path(shop)

    click_link_or_button 'Edit'
    fill_form(:shop, {name: 'myShop2'})
    fill_form(:address, { city: address.city, 'shop_address_attributes_postal_code'=> address.postal_code, street: address.street, house_number: address.house_number,country: address.country })



    click_link_or_button 'Update Shop'


    expect(page).to have_content 'myShop2'
    expect(page).to have_content address.city
    expect(page).to have_content address.postal_code
    expect(page).to have_content address.street
    expect(page).to have_content address.house_number
    expect(page).to have_content address.country
  end

  it 'can be deleted',:js => true do
    user = sign_in_user
    beer1 = FactoryGirl.create(:beer)
    beer2 = FactoryGirl.create(:beer)
    address = FactoryGirl.create(:address)
    shop = FactoryGirl.create(:shop,user: user)


    visit shop_path(shop)


    expect {
      click_link_or_button('Destroy')
      sleep 2.seconds
      alert = page.driver.browser.switch_to.alert
      alert.accept
      sleep 2.seconds
    }.to change(Shop, :count).by(-1)

  end



end