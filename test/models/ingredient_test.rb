require 'test_helper'

class IngredientTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should not save ingredient without name" do
    ingredient = Ingredient.new
    assert !ingredient.save
  end


  test "should not save with name too long" do
    ingredient = Ingredient.new
    ingredient.name = ("a"*200)
    assert !ingredient.save
  end

  test "should not save ingredient with same name twice" do
    ingredient1 = Ingredient.new
    ingredient2 = Ingredient.new
    ingredient1.name = ingredient2.name = "cabbage"
    assert ingredient1.save
    assert !ingredient2.save
  end
end