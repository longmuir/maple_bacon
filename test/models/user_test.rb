require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @user = User.new(password: "foobar", password_confirmation: "foobar")
  end

  test "should save @user with name and valid email" do
    @user.name = "Mr. Ed"
    @user.email = "ed@hotmail.com"
    assert @user.save
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
    @user.email = "okemail.com"
    @user.password = "funkyfoo"
    assert !@user.save
  end


end
