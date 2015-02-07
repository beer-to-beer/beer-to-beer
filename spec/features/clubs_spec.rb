require 'rails_helper'
describe "Clubs", :type => :feature do
  let!(:user) {
    FactoryGirl.create(:user, address: FactoryGirl.create(:address))
    user.add_role :admin
  }
  let!(:address) { FactoryGirl.create(:address)}
  let!(:club1) { FactoryGirl.create(:club, address: FactoryGirl.create(:address), user: user)}
  #let!(:events) { FactoryGirl.create(:event, club_id: Club.first.id)}


  before(:each) do
    visit root_path
    click_link 'Sign in'
    fill_in 'user_email', with: 'admin'
    fill_in 'user_password', with: 'Hallo123'
    click_button 'Sign in'
    expect(page).to have_content 'Signed in successfully'
  end

  after(:each) do
    visit "/users/sign_out"
  end

  it 'could be added' do
    visit new_club_path

    fill_form(:club, {name: Faker::Name.name, city: Faker::Address.city, postal_code: Faker::Address.postcode,
                      street: Faker::Address.street_name, house_number: Faker::Address.building_number,
                   country: Faker::Address.country, url: Faker::Internet.url, active: true})

    save_and_open_page
    expect{ click_on('Create Club') }.to change(Club, :count).by(1)
  end


  it 'could be deleted club' do

    club2 =  FactoryGirl.create(:club, address_id: Address.first.id)

    visit clubs_path
    #save_and_open_page
    #expect(page.has_content?('Destroy'))

    click_link('Destroy', href: club_path(club2))
    expect { find_button('OK').click }.to change(Club, :count).by(-1)

    #expect{Capybara.current_session.driver.delete club_path(club1.id)}.to change(Club, :count).by(-1)
  end
  it 'could be deleted and delete Address' do
    expect{Capybara.current_session.driver.delete club_path(club1.id)}.to change(Address, :count).by(-1)
  end
  it 'could be deleted and delete all Events' do
    expect{Capybara.current_session.driver.delete club_path(club1.id)}.to change(Club, :count).by(-1)
  end
end