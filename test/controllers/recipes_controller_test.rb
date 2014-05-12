require 'test_helper'
require_relative '../helpers/user_test_helper'


class RecipesControllerTest < ActionController::TestCase
  include UserTestHelper
  # test "the truth" do
  #   assert true
  # end
  test "should create recipe" do
    login_user
    assert_difference('Recipe.count') do
      post :create, recipe: {
                          title: 'Maple Pork Chops', 
                          additions_attributes: { "0" => { quantity: "3 lbs", ingredient_name: "apples"} }, 
                          steps_attributes: { "0" => { content: "Stir it up!"} }
                        }
    end
    assert_redirected_to recipe_path(assigns(:recipe))
  end

end
