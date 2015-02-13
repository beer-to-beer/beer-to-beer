require 'rails_helper'
require 'support/integration_test_helper'


describe 'Event' , :type => :feature do
  let!(:address) { FactoryGirl.create(:address)}
  let!(:club) { FactoryGirl.create(:club, address_id: address.id)}
  let!(:event) { FactoryGirl.create(:event, club_id: club.id)}

  it 'could be deleted event' do
    user = FactoryGirl.create(:user)
    user.add_role :admin
    visit root_path
    click_link 'Sign in'
    fill_form(:user, {email: user.email, password: 'Hallo123'})
    click_button 'Sign in'


    visit "/events/#{event.id}"

    expect{click_button 'Delete'}.to change(Event, :count).by(-1)
  end
end