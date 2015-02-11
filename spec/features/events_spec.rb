require 'rails_helper'
require 'support/integration_test_helper'


describe 'Event' , :type => :feature do
  let!(:address) { FactoryGirl.create(:address)}
  let!(:club) { FactoryGirl.create(:club, address_id: address.id)}
  let!(:event) { FactoryGirl.create(:event, club_id: club.id)}

  it 'could be deleted event' do
    visit '/users/sign_in'
    #fill_form(:user, {email: 'admin@beer.com', password: 'Admin123'})
    fill_in 'user[email]', with: 'admin@beer.com'
    fill_in 'user[password]', with: 'Admin123'
    save_and_open_page
    #click_button 'Sign in'
    visit "/events/#{event.id}"
    #save_and_open_page
    expect{click_button 'Delete'}.to change(Event, :count).by(-1)
  end
end