require 'rails_helper'

describe 'Ratings' do



  it 'can be created via form' do
    user = FactoryGirl.create(:user)
    beer = FactoryGirl.create(:beer)
    visit root_path
    click_link 'Sign in'
    fill_form(:user, {email: user.email, password: 'Hallo123'})
    click_button 'Sign in'

    visit new_rating_path(:beer_id => beer.id)
    fill_form(:rating, {headline: 'myHeadline', comment: 'myComment'})
    select 5.0, :from => "price"
    select 4.0, :from => "taste"
    select 2.0, :from => "headache"

    expect { click_button 'Create Rating' }.to change { Rating.count }.by(1)
    expect(page).to have_content user.email
    expect(page).to have_content beer.title
    expect(page).to have_content 'myHeadline'
    expect(page).to have_content 'myComment'
    expect(find(:css, 'select#criterion_Price').value).to eq('5.0')
    expect(find(:css, 'select#criterion_Taste').value).to eq('4.0')
    expect(find(:css, 'select#criterion_Headache').value).to eq('2.0')


  end
  it 'can be edited via form' do
    user = FactoryGirl.create(:user)
    beer = FactoryGirl.create(:beer)
    visit root_path
    click_link 'Sign in'
    fill_form(:user, {email: user.email, password: 'Hallo123'})
    click_button 'Sign in'

    rating2 = FactoryGirl.create(:rating,headline: 'myHeadline',comment: 'myCommment',user_id: user.id)
    FactoryGirl.create(:criterion, name: "Price", rating_id: rating2.id, value:4.0)
    FactoryGirl.create(:criterion, name: "Taste", rating_id: rating2.id,value:4.0)
    FactoryGirl.create(:criterion, name: "Headache", rating_id: rating2.id,value:4.0)
    visit rating_path(rating2)
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


  it 'can be deleted via form',:js => true do
    user = FactoryGirl.create(:user)
    beer = FactoryGirl.create(:beer)
    visit root_path
    click_link 'Sign in'
    fill_form(:user, {email: user.email, password: 'Hallo123'})
    click_button 'Sign in'

    rating2 = FactoryGirl.create(:rating,headline: 'myHeadline',comment: 'myCommment',user_id: user.id)
    FactoryGirl.create(:criterion, name: "Price", rating_id: rating2.id, value:4.0)
    FactoryGirl.create(:criterion, name: "Taste", rating_id: rating2.id,value:4.0)
    FactoryGirl.create(:criterion, name: "Headache", rating_id: rating2.id,value:4.0)

    visit rating_path(rating2)


    expect {
      click_link('Destroy')
      sleep 10.seconds
      alert = page.driver.browser.switch_to.alert
      alert.accept
      sleep 10.seconds
    }.to change(Rating, :count).by(-1)

  end
end