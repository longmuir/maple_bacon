require 'test_helper'
require_relative '../helpers/user_test_helper'

class CreateRecipeTest < ActionDispatch::IntegrationTest
  include UserTestHelper

  test "Create new recipe and submit" do
    user = login_user

    visit "/recipes/new"
    assert page.has_content?("New Recipe")

    fill_in 'recipe_title', with: "Maple Pork Chops"

    fill_in 'recipe_additions_attributes_0_quantity', with: "3 lbs"
    fill_in 'recipe_additions_attributes_0_ingredients_name', with: "pork"

    fill_in 'recipe_additions_attributes_1_quantity', with: "3 tsp"
    fill_in 'recipe_additions_attributes_1_ingredients_name', with: "maple syrup"

    fill_in 'recipe_steps_attributes_0_content', with: "Mix it up!"
    fill_in 'recipe_steps_attributes_1_content', with: "Do it again!"
   
    click_button "Done"
    assert page.has_content?("Maple Pork Chops")

  end

end