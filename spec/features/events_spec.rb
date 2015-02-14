require 'rails_helper'
require 'support/integration_test_helper'


describe 'Event' , :type => :feature do
  let!(:club1) {FactoryGirl.create(:club,active: true)}
  it 'could be added' do
    user = sign_in_admin
    visit new_event_path
    club1.user= user
    date = Faker::Time.forward(23, :morning)
    save_and_open_page
    fill_form(:event, {
                        title: Faker::Name.title,
                        event_sdate_1i: select(date.year),
                        event_sdate_2i: select(date.month),
                        event_sdate_3i: select(date.day),
                        event_sdate_4i: select(date.hour),
                        event_sdate_5i: select(date.min),
                        imageURL: File.new("#{Rails.root}/ace/app/assets/img/ace/uploads/event/image1.jpg"),
                        club: select(club1.name, from: 'event_club_id')
                    })
    save_and_open_page
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