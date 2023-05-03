require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(email: "user@example.com", password: "password", password_confirmation: "password", type: "Student")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "email should be present" do
    @user.email = "     "
    assert_not @user.valid?
  end

  test "email should be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test "type should be present" do
    @user.type = "   "
    assert_not @user.valid?
  end

  test "type should be one of Admin, SchoolAdmin, or Student" do
    invalid_user_types = %w[Teacher Parent Staff]
    invalid_user_types.each do |type|
      @user.type = type
      assert_not @user.valid?, "#{type.inspect} should not be a valid user type"
    end
  end

  test "password should be present" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end

  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end

  test "authenticated? should return false for a user with nil digest" do
    assert_not @user.authenticated?(:remember, '')
  end
end
