require 'rails_helper'
require 'support/integration_test_helper'

describe 'Event' , :type => :feature do
  let!(:club1) {FactoryGirl.create(:club,active: true)}
  it 'could be added' do
    user = sign_in_admin
    visit new_event_path
    club1.user= user
    date = Faker::Time.forward(23, :morning)

    fill_form(:event,:new, { title: input('event_title', Faker::Name.title.to_s) } )
   select(club1.name, from: 'event_club_id')
    attach_file('event_imageURL', "#{Rails.root}/ace/app/assets/img/ace/uploads/event/image1.jpg")

    select date.strftime('%Y'), :from => "event_sdate_1i" #year
    select date.strftime('%B'), :from => "event_sdate_2i" #month
    select date.strftime('%e').delete(' '), :from => 'event_sdate_3i'
    select date.strftime('%H'), :from => "event_sdate_4i" #hour
    select date.strftime('%M'), :from => "event_sdate_5i" #minute

    expect{click_button('Create Event')}.to change(Event, :count).by(1)
  end
  it 'could be deleted event' do
    sign_in_admin
    club = FactoryGirl.create(:club)
    event = FactoryGirl.create(:event, club_id: club.id)
    visit "/events/#{event.id}"

    expect{click_link 'Delete'}.to change(Event, :count).by(-1)
  end
end