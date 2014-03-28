require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, user: {name: 'Name', 
                          email: 'name@name.com', 
                          password: 'foobar', 
                          password_confirmation: 'foobar'}
    end
    assert_redirected_to user_path(assigns(:user))
  end

end
