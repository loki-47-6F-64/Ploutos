require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "user attr savings" do
    @user = User.new
    @user.password = 'test567890'
    @user.password_confirmation = 'test567890'
    @user.username = "testing"

    @user.savings = 'e'
    refute @user.save, 'User savings not a number'

    @user.savings = -1
    refute @user.save, 'User savings smaller than 0'

    @user.savings = 0
    assert @user.save, 'User savings not saved as 0 or greater'
  end

  test "create user attr username" do
    @user = User.new
    @user.savings = '0'

    @user.password = 'test567890'
    @user.password_confirmation = 'test567890'
    refute @user.save , 'User saved without username'

    @user.username = 'Loki'
    refute @user.save, 'Username saved while not unique'

    @user.username = 'test'
    assert @user.save, "User not saved with username #{@user.username}"
  end

  test "create user attr password" do
    @user = User.new
    @user.savings = '0'

    @user.username = 'testing'

    refute @user.save, 'User saved without password'

    @user.password = 'test'
    @user.password_confirmation = 'test'
    refute @user.save, 'User saved without correct length password'

    @user.password = 'test56'
    refute @user.save, 'User saved without password matching confirmation'

    @user.password_confirmation = 'test56'
    assert @user.save, 'User not saved with password matching confirmation'
  end

  test "update user password" do
    @user = users(:one)
    @user.password = 'drop'
    @user.password_confirmation = 'drop'

    refute @user.valid?(:update_password), 'Password is valid while length smaller than 6'

    @user.password = 'dropje'
    refute @user.valid?(:update_password), "Password is valid while it doesn't match confirmation"

    @user.password_confirmation = 'dropje'
    assert @user.valid?(:update_password), "Password is not valid while it should be valid #{@user.password}, #{@user.password_confirmation}"
  end
end
