require 'spec_helper'

module IntegrationTestHelper
  def sign_in_admin
    user = FactoryGirl.create(:user)
    user.add_role :admin
    visit root_path
    click_link 'Sign in'
    fill_form(:user, {email: user.email, password: 'Hallo123'})
    click_button 'Sign in'
    return user
  end
  def sign_in_user
    user = FactoryGirl.create(:user)
    user.add_role :user
    visit root_path
    click_link 'Sign in'
    fill_form(:user, {email: user.email, password: 'Hallo123'})
    click_button 'Sign in'
    return user
  end
end