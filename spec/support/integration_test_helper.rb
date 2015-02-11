require 'spec_helper'

module IntegrationTestHelper
  def sign_in_admin
    visit '/users/sign_in'
    #fill_form(:user, {email: 'admin@beer.com', password: 'Admin123'})
      fill_in 'Email', :with => 'admin@beer.com'
      fill_in 'Password', :with => 'Admin123'
    save_and_open_page
    click_button 'Sign in'

  end
  def sign_in_user
    visit '/users/sign_in'

      fill_in 'user_email', :with => 'beer@beer.com'
      fill_in 'user_password', :with => 'Hallo123'

    click_button 'Sign in'
  end
end