require 'test_helper'

class BrowseRecipeTest < ActionDispatch::IntegrationTest

  test "Guest can browse recipe, but can't edit" do
    skip
    recipe = FactoryGirl.create(:recipe)
    visit "/"
    assert page.has_content?("MAPLE. BACON. ENJOY.")

    click_link 'Just Looking'
    assert page.has_content?('Welcome')


    assert !page.has_content?('Edit')
    click_link 'Sign out'
    assert page.has_content?("MAPLE. BACON. ENJOY.")
  end
end