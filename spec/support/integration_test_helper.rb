require 'spec_helper'

module IntegrationTestHelper
  def sign_in_admin
    visit '/users/sign_in'

      fill_in 'Email', :with => 'admin@beer.com'
      fill_in 'Password', :with => 'Admin123'

    click_button 'Sign in'

  end
  def sign_in_user
    visit '/users/sign_in'

      fill_in 'Email', :with => 'beer@beer.com'
      fill_in 'Password', :with => 'Hallo123'

    click_button 'Sign in'
  end
end