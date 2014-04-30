require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should save Recipe with only title" do
    recipe = Recipe.new
    recipe.title = "Cookies"
    assert recipe.save
  end

  test "should not save Recipe without title" do
    recipe = Recipe.new
    assert !recipe.save
  end

  test "should save recipe with ingredient" do
    recipe = Recipe.new
    recipe.title = "Cookies"

    apples = Ingredient.new(name: "apples")
    apples.save
    recipe.additions.build(ingredient: apples, quantity: "10")

    recipe.steps.build(content: "Mix it up!")
    recipe.steps.build(content: "Do it again!")

    assert recipe.save
  end
  
end
