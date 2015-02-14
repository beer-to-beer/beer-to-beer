require 'rails_helper'

describe 'Sign up' do
  before(:each) do
    visit root_path
  end
  email = Faker::Internet.email

  it 'allows to sign up' do
    click_link 'Sign up'

    fill_form(:user, { email: email, 'user_password' =>'hallo123', 'user_password_confirmation'=> 'hallo123', 'user_first_name' =>'Peter', 'user_last_name' => 'Mueller'})

    fill_form(:address, { city: 'Steinfurt', postal_code: '48565', street: 'meinestrasse', house_number: '8',country: 'Deutschland'})


    expect { click_button 'Register' }.to change { User.count }.by(1)

    expect(page).to have_content email
  end
end