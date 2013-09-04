require 'test_helper'

class IncomeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "create income attr amount" do
    @income = Income.new

    refute @income.save, 'Saved while amount is blanc'
    
    @income.amount = 0
    refute @income.save, 'Saved while amount smaller than or equal to 0'

    @income.amount = 1
    assert @income.save, 'Not saved while amount greater than 0' 
  end
end
