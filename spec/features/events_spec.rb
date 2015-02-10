require 'rails_helper'
require 'support/integration_test_helper'


describe 'Event' do
  let!(:address) { FactoryGirl.create(:address)}
  let!(:club) { FactoryGirl.create(:club, address_id: address.id)}
  let!(:event) { FactoryGirl.create(:event, club_id: club.id)}

  it 'could be deleted event' do
    sign_in_admin
    visit "/events/#{event.id}"
    save_and_open_page
    expect{click_button 'Delete'}.to change(Event, :count).by(-1)
  end
end