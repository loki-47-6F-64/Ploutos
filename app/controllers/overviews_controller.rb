class OverviewsController < ApplicationController
before_action :authenticate, only: [:index]
  include Finance

  def index
    @spendable = money_left @current_user
  end
end
