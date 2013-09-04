require 'test_helper'

class FixedCostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "create fixed cost attr amount" do
    @fixed_cost = FixedCost.new( :user_id => 1, :type_id => 1, :frequency => 1 )
    refute @fixed_cost.save, 'Saved while amount blanc'

    @fixed_cost.amount = 0
    assert @fixed_cost.save, 'Not saved while amount is greater than or equal to 0'
  end


  test "create fixed_cost attr type_id" do
    @fixed_cost = FixedCost.new( :user_id => 1, :amount => 1, :frequency => 1 )
    refute @fixed_cost.save, 'Saved while type_id blanc'

    @fixed_cost.type_id = 100000
    refute @fixed_cost.save, 'Saved while type does not exist'

    @fixed_cost.type_id = 1
    assert @fixed_cost.save, 'Not saved while type_id is valid'
  end


  test "creeate fixed_cost attr frequency" do
    @fixed_cost = FixedCost.new( :user_id => 1, :amount => 1, :type_id => 1 )

    refute @fixed_cost.save, 'Saved while frequency blanc'

    @fixed_cost.frequency = 0
    refute @fixed_cost.save, 'Saved while frequency equals 0'

    @fixed_cost.frequency = 1
    assert @fixed_cost.save, 'Not saved while frequency greater than 0'
  end
end
