require 'rails_helper'

describe 'Sign in' do
  context 'existing user' do
    let!(:user) { FactoryGirl.create(:user) }





    it 'allows to sign in' do
      visit root_path
      click_link 'Sign in'
      fill_form(:user, { email: 'test@test.de', password: 'Hallo123' })
      click_button 'Sign in'
      save_and_open_page
      expect(page).to have_content user.email
    end

   it 'allows to sign out' do
      visit root_path
      click_link 'Sign in'
      fill_form(:user, { email: 'test@test.de', password: 'Hallo123' })
      click_button 'Sign in'
      click_link user.email
      expect(page).to have_content 'Sign in'
    end
  end
end