require 'test_helper'

class SessionsControllerTest < ActionController::TestCase

  #Need to create dummy data for this test - a dummy user!
  test "should redirect to user page after successful signin" do
    user = FactoryGirl.create(:user)
    get(:create, {email: user.email, password: user.password})
    assert_redirected_to(controller: "users", action:"show", id: user.id)
  end

  test "should stay on sign in page after failed signin attempt" do
    user = FactoryGirl.create(:user)
    get(:create, {email: user.email, password: "bad_password"})
    assert_response(200)
    assert(flash[:error].include?("Invalid"), "Invalid Flash failed to appear")
  end

end
