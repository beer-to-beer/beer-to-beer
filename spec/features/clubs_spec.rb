require 'rails_helper'
describe 'Clubs' do
  let!(:address) { FactoryGirl.create(:address)}
  let!(:club) { FactoryGirl.create(:club, address_id: Address.first.id)}
  it 'could be deleted club' do
    expect{Capybara.current_session.driver.delete club_path(club.id)}.to change(Club, :count).by(-1)
  end
end