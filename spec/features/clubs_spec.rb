require 'rails_helper'
describe "Clubs", :type => :feature do


  #let!(:events) { FactoryGirl.create(:event, club_id: Club.first.id)}
  #address= FactoryGirl.create(:address)
  #club1=FactoryGirl.create(:club, address: FactoryGirl.create(:address), user: user)



  it 'could be added' do
    sign_in_admin

    visit new_club_path
    fill_form(:club, {name: Faker::Name.name, city: Faker::Address.city, postal_code: Faker::Address.postcode,
                      street: Faker::Address.street_name, house_number: Faker::Address.building_number,
                      country: Faker::Address.country, url: Faker::Internet.url, active: true})

    expect{ click_button('Create Club') }.to change(Club, :count).by(1)
  end


  it 'could be deleted club',:js => true do

    user = sign_in_admin

    club2 =  FactoryGirl.create(:club, active:true,user: user)

    visit clubs_path

    #expect(page.has_content?('Destroy'))


    expect {
      click_link('Destroy', href: club_path(club2))
      sleep 10.seconds
      alert = page.driver.browser.switch_to.alert
      alert.accept
      sleep 10.seconds
    }.to change(Club, :count).by(-1)

  end


  it 'could be deleted and delete Address',:js => true do
    user = sign_in_admin

    club3 =  FactoryGirl.create(:club, active:true,user: user, address: FactoryGirl.create(:address) )

    visit clubs_path

    #expect(page.has_content?('Destroy'))


    expect {
      click_link('Destroy', href: club_path(club3))
      sleep 10.seconds
      alert = page.driver.browser.switch_to.alert
      alert.accept
      sleep 10.seconds
    }.to change(Address, :count).by(-1)

  end
  it 'could be deleted and delete all Events',:js => true do
    user = sign_in_admin

    club4 =  FactoryGirl.create(:club, active:true,user: user )
    FactoryGirl.create(:event, club: club4)
    visit clubs_path

    #expect(page.has_content?('Destroy'))

    expect {
      click_link('Destroy', href: club_path(club4))
      sleep 10.seconds
      alert = page.driver.browser.switch_to.alert
      alert.accept
      sleep 10.seconds
    }.to change(Event, :count).by(-1)
  end
end