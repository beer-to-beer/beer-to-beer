require 'rails_helper'
require 'support/integration_test_helper'


describe 'Event' , :type => :feature do
  it 'could be added' do
    sign_in_admin



  end
  it 'could be deleted event' do
    #user = FactoryGirl.create(:user)
    #user.add_role :admin



    #visit root_path
    #click_link 'Sign in'
    #fill_form(:user, {email: user.email, password: 'Hallo123'})
    #click_button 'Sign in'
    sign_in_admin
    club = FactoryGirl.create(:club)
    event = FactoryGirl.create(:event, club_id: club.id)
    visit "/events/#{event.id}"

    expect{click_link 'Delete'}.to change(Event, :count).by(-1)
  end
end