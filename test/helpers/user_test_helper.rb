module UserTestHelper
  
  def login_user
    user = FactoryGirl.create(:user)

    visit "/"
    assert page.has_content?("MAPLE. BACON. ENJOY.")

    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign In'

    assert page.has_content?('Welcome')
    user
  end

end