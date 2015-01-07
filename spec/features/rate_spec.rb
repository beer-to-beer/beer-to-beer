require 'rails_helper'
describe 'Ratings' do

  let!(:rating1) { FactoryGirl.create(:rating)}
  let!(:user) { FactoryGirl.create(:user) }
  let!(:beer) { FactoryGirl.create(:beer) }
  it 'could be created' do

    expect{ FactoryGirl.create(:rating)}.to change(Rating, :count).by(1)
  end

  it 'could be deleted' do
    expect{Capybara.current_session.driver.delete rating_path(rating1.id)}.to change(Rating, :count).by(-1)
  end

  it 'allows to sign up' do

    visit root_path
    click_link 'Sign in'
    fill_form(:user, { email: 'test@test.de', password: 'Hallo123' })
    click_button 'Sign in'

    visit new_rating_path(:beer_id => :beer.id)
    fill_form(:rating, { comment: 'afdaf'})
    fill_form(:criterion, { name: 'Price', value: 5})
    fill_form(:criterion, { name: 'Taste', value: 5})
    fill_form(:criterion, { name: 'Headache', value: 5})
    expect { click_button 'Create Rating' }.to change { Rating.count }.by(1)
    expect(page).to have_content 'test@test.de'
    expect(page).to have_content :beer.title
  end
end