require 'test_helper'

class UserLoginTest < ActionDispatch::IntegrationTest

  test "Visit home page and sign in and out" do
    user = FactoryGirl.create(:user)

    visit "/"
    assert page.has_content?("MAPLE. BACON. ENJOY.")

    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign In'
    assert page.has_content?('Welcome')

    click_link 'Sign out'
    assert page.has_content?("MAPLE. BACON. ENJOY.")
  end

  test "Non-signed in user cannot visit user page" do
    user = FactoryGirl.create(:user)

    visit "/users/1"
    assert !page.has_content?('Welcome')
    assert page.has_content?("Sign In")
  end

end