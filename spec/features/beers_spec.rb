require 'rails_helper'

describe 'Beers' do
  it 'can be created' do
    user = sign_in_user
    producer = FactoryGirl.create(:producer)
    category = FactoryGirl.create(:category)

    visit "/beers/new"
    fill_form(:beer, {title: 'myBeer'})
    fill_form(:producer, {"beer_producer_attributes_name" => producer.name})
    fill_form(:category, {"beer_category_attributes_name" => category.name})


    expect { click_button 'Create Beer' }.to change { Beer.count }.by(1)
    expect(page).to have_content 'myBeer'
    expect(page).to have_content producer.name
    expect(page).to have_content category.name

  end

  it 'can be edited' do
    user = sign_in_admin
    beer1 = FactoryGirl.create(:beer)


    visit beer_path(beer1)

    click_link_or_button 'Edit'

    fill_form(:beer, {title: 'myBeer2'})

    fill form(:category, { "beer_category_attributes_name" => 'Category2' })

    fill_form(:producer, { "beer_producer_attributes_name" => 'Producer2' })



    click_link_or_button 'Update Beer'


    expect(page).to have_content 'myBeer2'
    expect(page).to have_content 'Producer2'

  end

  it 'can be deleted',:js => true do
    user = sign_in_admin
    beer1 = FactoryGirl.create(:beer)
    visit beer_path(beer1)


    expect {
      click_link_or_button('Delete')
      sleep 2.seconds
      alert = page.driver.browser.switch_to.alert
      alert.accept
      sleep 2.seconds
    }.to change(Beer, :count).by(-1)

  end



end