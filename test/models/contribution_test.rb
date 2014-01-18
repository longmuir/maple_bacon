require 'test_helper'

class ContributionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should save a new contribution" do
    contribution = Contribution.new
    contribution.user_id = User.new.id
    contribution.recipe_id = Recipe.new.id
    assert contribution.save
  end
  
end
