class OverviewsController < ApplicationController
  include Finance

  def index
    fixed_costs = FixedCosts.all
    incomes = Income.all

    @spendable = money_left incomes, fixed_costs
  end
end
