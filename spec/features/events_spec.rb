require 'rails_helper'
require 'support/integration_test_helper'

describe 'Event' , :type => :feature do
  let!(:club1) {FactoryGirl.create(:club,active: true)}
  it 'could be added' do
    user = sign_in_admin
    visit new_event_path
    club1.user= user
    date = Faker::Time.forward(23, :morning)

    input('event_title', Faker::Name.title.to_s)
    select(club1.name, from: 'event_club_id')
    attach_file('event_imageURL', "#{Rails.root}/ace/app/assets/img/ace/uploads/event/image1.jpg")
    select date.strftime('%Y'), :from => "event_sdate_1i"
    select date.strftime('%B'), :from => "event_sdate_2i"
    select date.strftime('%e').delete(' '), :from => 'event_sdate_3i'
    select date.strftime('%H'), :from => "event_sdate_4i"
    select date.strftime('%M'), :from => "event_sdate_5i"

    expect{click_button('Create Event')}.to change(Event, :count).by(1)
  end
  it 'could be deleted event',:js => true do
    sign_in_admin
    club = FactoryGirl.create(:club)
    event = FactoryGirl.create(:event, club_id: club.id)
    visit "/events/#{event.id}"

    expect{
      click_link('Destroy')
      sleep 2.seconds
      alert = page.driver.browser.switch_to.alert
      alert.accept
      sleep 2.seconds
    }.to change(Event, :count).by(-1)
  end
end