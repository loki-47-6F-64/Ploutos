class IncomesController < ApplicationController
  def new
    @income = Income.new
  end
  def create
    @income = Income.new(income_params)

    @income.save
  end

  def income_params
    params[:income].permit(:start, :end, :amountRound, :amountDecimal, :description)
  end
end
