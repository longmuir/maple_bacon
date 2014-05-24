require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @user = User.new(password: "foobar", password_confirmation: "foobar")
  end

  def regular_user
    User.new(name: "Mr. Ed",
             email: "ed@hotmail.com",
             password: "foobar", 
             password_confirmation: "foobar", )
  end

  test "should respond to password_digest" do 
    assert_respond_to(@user, :password_digest)
  end

  test "should save user with name and valid email" do
    assert regular_user.save
  end

  test "should save @user with remember_token" do
    @user.name = "Mr. Ed"
    @user.email = "ed@hotmail.com"
    assert @user.save
    assert_not_nil @user.remember_token
  end
  
  test "should not save @user without name" do
    assert !@user.save
  end

  test "should not save @user without email" do
    @user.name = "Mr. Ed"
    assert !@user.save
  end

  test "should not have name too long" do
    @user.name = ("a"*200)
    @user.email = "ok@email.com"
    assert !@user.save
  end

  test "should not have invalid email" do
    @user.name = "Mr. Ed"
    @user.email = "okemail.com"
    assert !@user.save
  end

   test "should not have mismatching passwords" do
    @user.name = "Mr. Ed"
    @user.email = "ok@email.com"
    @user.password = "funkyfoo"
    assert !@user.save
  end

  test "should not have password too short" do
    @user.name = "Mr. Ed"
    @user.email = "ok@email.com"
    @user.password = "foo"
    @user.password_confirmation = "foo"
    assert !@user.save
  end

  test "regular user cannot delete other users" do
    user = User.new(password: "foobar", password_confirmation: "foobar")
  end

end
