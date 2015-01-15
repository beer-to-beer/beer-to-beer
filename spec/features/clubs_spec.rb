require 'rails_helper'
describe 'Clubs' do


  let!(:address) { FactoryGirl.create(:address)}
  let!(:club1) { FactoryGirl.create(:club, address_id: Address.first.id)}
  let!(:event) { FactoryGirl.create(:event, club_id: Club.first.id)}
  it 'could be added' do

    expect{ FactoryGirl.create(:club, address_id: Address.first.id) }.to change(Club, :count).by(1)
  end
  it 'could be deleted club' do
    sign_in_admin
    visit clubs_path
    click_link 'Destroy'
    expect { click_button 'OK' }.to change(Club, :count).by(-1)

    #expect{Capybara.current_session.driver.delete club_path(club1.id)}.to change(Club, :count).by(-1)
  end
  it 'could be deleted and delete Address' do
    expect{Capybara.current_session.driver.delete club_path(club1.id)}.to change(Address, :count).by(-1)
  end
  it 'could be deleted and delete all Events' do
    expect{Capybara.current_session.driver.delete club_path(club1.id)}.to change(Club, :count).by(-1)
  end
end