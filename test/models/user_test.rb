require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should not save user without name" do
    user = User.new
    assert !user.save
  end

  test "should not save user without email" do
    user = User.new
    user.name = "Mr. Ed"
    assert !user.save
  end

  test "should not have name too long" do
    user = User.new
    user.name = ("a"*200)
    user.email = "ok@email.com"
    assert !user.save
  end

  test "should not have invalid email" do
    user = User.new
    user.name = "Mr. Ed"
    user.email = "okemail.com"
    assert !user.save
  end

end
