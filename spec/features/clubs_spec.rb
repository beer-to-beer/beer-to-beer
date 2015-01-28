require 'rails_helper'
describe "Clubs", :type => :feature do

  let!(:address) { FactoryGirl.create(:address)}
  let!(:club1) { FactoryGirl.create(:club, address_id: Address.first.id)}
  let!(:events) { FactoryGirl.create(:events, club_id: Club.first.id)}
  let!(:user) {
    FactoryGirl.create(:user)
    user.add_role :admin
  }

it 'user can login' do
  visit root_path
  click_link 'Sign in'
  fill_in 'user_email', with: user.email
  fill_in 'user_password', with: 'Hallo123'
  click_button 'Sign in'
  expect(user.has_role? :admin)

  expect(page).to have_content 'Signed in successfully'
end
  it 'could be added' do
    visit root_path
    click_link 'Sign in'
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: 'Hallo123'
    click_button 'Sign in'
    expect(page).to have_content 'Signed in successfully'
    visit new_club_path

    #fill_form(:club, {name: 'Test Club'})
    fill_in 'club_name', :with => 'Test Club'
    fill_in 'club_address_attributes_city', :with => 'Münster'
    fill_in 'club_address_attributes_postal_code', :with => '48143'
    fill_in 'club_active', :with => true
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