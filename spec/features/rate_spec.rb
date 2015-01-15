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

  it 'can be created via form' do

    visit root_path
    click_link 'Sign in'
    fill_form(:user, { email: 'test@test.de', password: 'Hallo123' })
    click_button 'Sign in'

    visit new_rating_path(:beer_id => beer.id)
    fill_form(:rating, { headline: 'myHeadline',comment: 'myComment'})
    select 5.0, :from => "price"
    select 5.0, :from => "taste"
    select 5.0, :from => "headache"

    expect { click_button 'Create Rating' }.to change { Rating.count }.by(1)
    expect(page).to have_content 'test@test.de'
    expect(page).to have_content beer.title
    expect(page).to have_content 'myHeadline'
    expect(page).to have_content 'myComment'
    expect(page).to have_content '5.0'
  end
end