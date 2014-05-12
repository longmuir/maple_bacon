require 'test_helper'
require_relative '../helpers/user_test_helper'

class CreateRecipeTest < ActionDispatch::IntegrationTest
  include UserTestHelper

  test "Create new recipe and submit" do
    user = login_user_via_root

    visit "/recipes/new"
    assert page.has_content?("New Recipe")

    fill_in 'recipe_title', with: "Maple Pork Chops"

    fill_in 'recipe_additions_attributes_0_quantity', with: "3 lbs"
    fill_in 'recipe_additions_attributes_0_ingredient_name', with: "pork"

    fill_in 'recipe_additions_attributes_1_quantity', with: "3 tsp"
    fill_in 'recipe_additions_attributes_1_ingredient_name', with: "maple syrup"

    fill_in 'recipe_steps_attributes_0_content', with: "Mix it up!"
    fill_in 'recipe_steps_attributes_1_content', with: "Do it again!"
   
    click_button "Done"
    assert page.has_content?("Maple Pork Chops")
    assert page.has_content?("3 lbs of pork")
    assert page.has_content?("Mix it up!")
  end

  test "Edit existing recipe should change recipe" do
    skip
    # need to sort out issues with factory girl
    user = login_user_via_root
    recipe = FactoryGirl.create(:recipe)

    visit "/recipes/#{recipe.id}"
    assert page.has_content(recipe.title)
    assert page.has_content(recipe.additions.first.quantity)
    assert page.has_content(recipe.additions.first.ingredient_name)
  end

end