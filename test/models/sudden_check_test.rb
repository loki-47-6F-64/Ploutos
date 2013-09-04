require 'test_helper'

class SuddenCheckTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "create sudden_check attr amount" do
    @sudden_check = SuddenCheck.new( :is_income => 1 )
    refute @sudden_check.save, 'Saved while amount blanc'

    @sudden_check.amount = 0
    refute @sudden_check.save, 'Saved while amount smaller than or equal to 0'

    @sudden_check.amount = 1
    assert @sudden_check.save, 'Not saved while amount greater than 0'
  end


  test "create sudden_check attr is_income" do
    @sudden_check = SuddenCheck.new( :amount => 1 )
    refute @sudden_check.save, 'Saved while is_income is blanc'

    @sudden_check.is_income = 0
    refute @sudden_check.save, 'Saved while is_income is not equal to 1 or -1'

    @sudden_check.is_income = 1
    assert @sudden_check.save, 'Not saved while is_income equals 1'

    @sudden_check.is_income = -1
    assert @sudden_check.save, 'Not saved while is_income equals -1'
  end
end
