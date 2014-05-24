require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "unsigned in should not get index" do
    get :index
    assert_redirected_to signin_path
  end

  test "unsignedin user should not get show page" do
    get(:show, {'id' => "1"})
    assert_redirected_to signin_path
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
