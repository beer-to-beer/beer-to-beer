require 'rails_helper'

describe 'Sign in' do
  context 'existing user' do
    let!(:user) { FactoryGirl.create(:user) }





    it 'allows to sign in' do
      visit root_path
      click_link 'Sign in'
      fill_form(:user, { email: user.email, password: 'Hallo123' })
      click_button 'Sign in'
      expect(page).to have_content user.email
    end

   it 'allows to sign out', js:true do
      visit root_path
      click_link 'Sign in'
      fill_form(:user, { email: user.email, password: 'Hallo123' })
      click_button 'Sign in'
      click_link user.email
      expect(page).to have_content 'SIGN IN'
    end
  end
end