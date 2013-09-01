class OverviewsController < ApplicationController
before_action :authenticate, only: [:index]
  include Finance

  def index
    fixed_costs = @current_user.fixed_costs
    incomes = @current_user.incomes

    @spendable = money_left incomes, fixed_costs
  end
end
