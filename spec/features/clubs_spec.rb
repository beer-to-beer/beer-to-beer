require 'rails_helper'
describe "Clubs", :type => :feature do


  #let!(:events) { FactoryGirl.create(:event, club_id: Club.first.id)}
  #address= FactoryGirl.create(:address)
  #club1=FactoryGirl.create(:club, address: FactoryGirl.create(:address), user: user)


  before(:each) do


   #kann hier wieder rein, bin jetzt zu faul



    #expect(page).to have_content user.email
  end

  after(:each) do
    #visit "/users/sign_out"
  end

  it 'could be added' do
    user = FactoryGirl.create(:user)
    user.add_role :admin
    visit root_path
    click_link 'Sign in'
    fill_form(:user, {email: user.email, password: 'Hallo123'})
    click_button 'Sign in'

    visit new_club_path
    fill_form(:club, {name: Faker::Name.name, city: Faker::Address.city, postal_code: Faker::Address.postcode,
                      street: Faker::Address.street_name, house_number: Faker::Address.building_number,
                      country: Faker::Address.country, url: Faker::Internet.url, active: true})

    expect{ click_button('Create Club') }.to change(Club, :count).by(1)
  end


  it 'could be deleted club',:js => true do

    user = FactoryGirl.create(:user)
    user.add_role :admin
    visit root_path
    click_link 'Sign in'
    fill_form(:user, {email: user.email, password: 'Hallo123'})
    click_button 'Sign in'

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
    user = FactoryGirl.create(:user)
    user.add_role :admin
    visit root_path
    click_link 'Sign in'
    fill_form(:user, {email: user.email, password: 'Hallo123'})
    click_button 'Sign in'

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
    user = FactoryGirl.create(:user)
    user.add_role :admin
    visit root_path
    click_link 'Sign in'
    fill_form(:user, {email: user.email, password: 'Hallo123'})
    click_button 'Sign in'

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