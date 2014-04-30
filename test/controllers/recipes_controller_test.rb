require 'test_helper'

class RecipesControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should create recipe" do
      assert_difference('Recipe.count') do
      post :create, recipe: {
                          name: 'Maple Pork Chops', 
                          additions_attributes: { quantity: "3", ingredients: {name: "apples"}}, 
                          steps_attributes: { content: "Stir it up!"}
                        }
    end
    assert_redirected_to recipe_path(assigns(:user))
  end
end
