class OverviewsController < ApplicationController
before_action :authenticate, only: [:index]
  include Finance

  def index
    fixed_costs = FixedCosts.all
    incomes = Income.all

    @spendable = money_left incomes, fixed_costs
  end
end
