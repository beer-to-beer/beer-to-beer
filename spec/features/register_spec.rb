require 'rails_helper'

describe 'Sign up' do
  before(:each) do
    visit root_path
  end

  it 'allows to sign up' do
    click_link 'Sign up'
    fill_form(:user, { email: 'test@test.de', password: 'hallo123', password_confirmation: 'hallo123', first_name: 'Peter', last_name: 'Mueller'})
    fill_form(:address, { city: 'Steinfurt', postal_code: '48565', street: 'meinestrasse', house_number: '8',country: 'Deutschland'})


   # fill_in 'user_email', with: 'mjohann@rails-experts.com'
    #fill_in 'user_password', with: 'Spacken123'
    #fill_in 'user_password_confirmation', with: 'Spacken123'
    #fill_in 'user_first_name', with: 'Spack'
    #fill_in 'user_last_name', with: 'Spacken'

  #    fill_in 'city', with: 'Steinfurt'
 #     fill_in 'postal_code', with: '48565'
 #     fill_in 'street', with: 'Spacken123'
#      fill_in 'house_number', with: '8'
#      fill_in 'country', with: 'Deutschland'



    expect { click_button 'Sign up' }.to change { User.count }.by(1)

    expect(page).to have_content 'test@test.de'
  end
end