require 'test_helper'

class AdditionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should not save addition without quantity" do
    randomIngredient = Ingredient.new
    addition = Addition.new
    addition.ingredient_id = randomIngredient.id
    assert !addition.save
  end
  
end
