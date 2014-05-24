require 'test_helper'

class BrowseRecipeTest < ActionDispatch::IntegrationTest

  test "Guest can browse recipe, but can't edit" do
    recipe = FactoryGirl.create(:recipe)
    visit "/"
    assert page.has_content?("MAPLE. BACON. ENJOY.")

    click_link 'Just Looking'
    assert page.has_content?('Welcome')
    assert page.has_content?(recipe.title)

    click_link recipe.title
    assert !page.has_content?("Edit")
    assert !page.has_content?("Delete")
  end
end