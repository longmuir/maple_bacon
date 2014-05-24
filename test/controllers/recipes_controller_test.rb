require 'test_helper'
require_relative '../helpers/user_test_helper'


class RecipesControllerTest < ActionController::TestCase
  include UserTestHelper


  test "unsignedin user can view recipe" do
    recipe = FactoryGirl.create(:recipe)
    get(:show, {'id' => recipe.id})
    assert_response :success
  end

  test "unsignedin user cannot edit recipe" do
    recipe = FactoryGirl.create(:recipe)
    get(:edit, {'id' => recipe.id})
    assert_redirected_to signin_path
  end

  test "unsignedin user cannot delete recipe" do
    recipe = FactoryGirl.create(:recipe)
    delete(:destroy, {'id' => recipe.id})
    assert_redirected_to signin_path
  end

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
