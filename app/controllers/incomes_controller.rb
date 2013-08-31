class IncomesController < ApplicationController
  def new
    @income = Income.new
  end

  def edit
    @income = Income.find(params[:id])
  end

  def index
    @incomes = Income.all
  end

  def show
    @income = Income.find params[:id]
  end

  def create
    @income = Income.new(income_params)

    if @income.save
      redirect_to incomes_path
    else
      render 'new'
    end
  end

  def update
    @income = Income.find(params[:id])

    if @income.update income_params
      redirect_to incomes_path
    else
      render 'edit'
    end
  end

  def destroy
    @income = Income.find params[:id]

    @income.destroy
    redirect_to incomes_path
  end

  def income_params
    params[:income].permit(:amountRound, :amountDecimal, :description)
  end
end
