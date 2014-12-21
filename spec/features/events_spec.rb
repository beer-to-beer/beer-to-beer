require 'rails_helper'
describe 'Event' do
  let!(:event) { FactoryGirl.create(:event, club_id: Club.first.id)}

  it 'could be deleted event' do
    expect{Capybara.current_session.driver.delete event_path(event.id)}.to change(Event, :count).by(-1)
  end
end