require 'rails_helper'
describe 'Ratings' do

  let!(:rating1) { FactoryGirl.create(:rating) }
  let!(:criterion1) { FactoryGirl.create(:criterion, name: "Price", rating_id: Rating.first.id) }
  let!(:criterion2) { FactoryGirl.create(:criterion, name: "Taste", rating_id: Rating.first.id) }
  let!(:criterion3) { FactoryGirl.create(:criterion, name: "Headache", rating_id: Rating.first.id) }
  let!(:user) { FactoryGirl.create(:user) }
  let!(:beer) { FactoryGirl.create(:beer) }

  it 'could be created' do

    expect { FactoryGirl.create(:rating) }.to change(Rating, :count).by(1)
  end

  it 'could be deleted' do
    expect { Capybara.current_session.driver.delete rating_path(rating1.id) }.to change(Rating, :count).by(-1)
  end

  it 'can be created via form' do

    visit root_path
    click_link 'Sign in'
    fill_form(:user, {email: 'test@test.de', password: 'Hallo123'})
    click_button 'Sign in'

    visit new_rating_path(:beer_id => beer.id)
    fill_form(:rating, {headline: 'myHeadline', comment: 'myComment'})
    select 5.0, :from => "price"
    select 4.0, :from => "taste"
    select 2.0, :from => "headache"

    expect { click_button 'Create Rating' }.to change { Rating.count }.by(1)
    expect(page).to have_content 'test@test.de'
    expect(page).to have_content beer.title
    expect(page).to have_content 'myHeadline'
    expect(page).to have_content 'myComment'
    expect(find(:css, 'select#criterion_Price').value).to eq('5.0')
    expect(find(:css, 'select#criterion_Taste').value).to eq('4.0')
    expect(find(:css, 'select#criterion_Headache').value).to eq('2.0')


  end
  it 'can be edited via form' do

    visit root_path
    click_link 'Sign in'
    fill_form(:user, {email: 'test@test.de', password: 'Hallo123'})
    click_button 'Sign in'

    visit rating_path(:id => 1)

    click_link 'Edit'
    fill_form(:rating, {headline: 'myHeadline2', comment: 'myComment2'})

    select 1.0, :from => "price"
    select 2.0, :from => "taste"
    select 3.0, :from => "headache"
    click_link_or_button 'Update Rating'


    expect(page).to have_content 'myHeadline2'
    expect(page).to have_content 'myComment2'
    expect(find(:css, 'select#criterion_Price').value).to eq('1.0')
    expect(find(:css, 'select#criterion_Taste').value).to eq('2.0')
    expect(find(:css, 'select#criterion_Headache').value).to eq('3.0')
  end
  it 'can be edited via form' do

    visit root_path
    click_link 'Sign in'
    fill_form(:user, {email: 'test@test.de', password: 'Hallo123'})
    click_button 'Sign in'

    visit ratings_path()


    expect { click_link 'Destroy' }.to change(Rating, :count).by(-1)


  end
end