require 'test_helper'

class UserLoginTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "Sign In" do
    get signin_path
    assert_response :success
  end
end
