require 'rails_helper'
describe 'Clubs' do
  let!(:club) { FactoryGirl.create(:club)}
  it 'could be deleted club' do
    expect{Capybara.current_session.driver.delete club_path(club.id)}.to change(Club, :count).by(-1)
  end
end