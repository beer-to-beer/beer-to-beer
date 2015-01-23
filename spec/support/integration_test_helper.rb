module IntegrationTestHelper
  def sign_in_admin
    user = FactoryGirl.create(:user)
    visit root_path
    click_link 'Sign in'
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: 'Hallo123'
    click_button 'Sign in'
  end
  def sign_in_user
    visit root_path
    click_link 'Sign in'
    fill_in 'user_email', with: 'beer@beer.com'
    fill_in 'user_password', with: 'Hallo123'
    click_button 'Sign in'
  end
end