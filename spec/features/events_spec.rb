require 'rails_helper'
require 'support/integration_test_helper'


describe 'Event' , :type => :feature do
  it 'could be added' do
    user = sign_in_admin
    visit new_event_path
    club = FactoryGirl.create(:club, user: user)
    date = Faker::Time.forward(23, :morning)
    fill_form(:event, {
                        title: Faker::Name.title,
                        event_sdate_1i: select(date.year),
                        event_sdate_2i: select(date.month),
                        event_sdate_3i: select(date.day),
                        event_sdate_4i: select(date.hour),
                        event_sdate_5i: select(date.min),
                        imageURL: File.new("#{Rails.root}/ace/app/assets/img/ace/uploads/event/image1.jpg"),
                        club: select(club.name, options = {match: :first})})

    #Save_and_Open_Page
    expect{click_link 'Create Event'}.to change(Event, :count).by(1)

  end
  it 'could be deleted event' do
    sign_in_admin
    club = FactoryGirl.create(:club)
    event = FactoryGirl.create(:event, club_id: club.id)
    visit "/events/#{event.id}"

    expect{click_link 'Delete'}.to change(Event, :count).by(-1)
  end
end