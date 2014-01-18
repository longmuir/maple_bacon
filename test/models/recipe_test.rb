require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should not save Recipe without title" do
    recipe = Recipe.new
    assert !recipe.save
  end
  
end
