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
    fill_form(:event,:new, {
                        title: input('event_title', Faker::Name.title.to_s),
                        sdate_1i: select(date.strftime('%Y'), from: 'event_sdate_1i'),
                        sdate_2i: select(date.strftime('%B'), from: 'event_sdate_2i'),
                        sdate_3i: select(date.strftime('%e').delete(' '), from: 'event_sdate_3i'),
                        sdate_4i: select(date.strftime('%H'), from: 'event_sdate_4i'),
                        sdate_5i: select(date.strftime('%M'), from: 'event_sdate_5i'),
                        imageURL: File.new("#{Rails.root}/ace/app/assets/img/ace/uploads/event/image1.jpg"),
                        club_id: select(club1.name)
                    }
    )
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