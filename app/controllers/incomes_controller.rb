class IncomesController < ApplicationController
  def new
    @income = Income.new
  end

  def edit
    @income = Income.find(params[:id])
  end

  def create
    @income = Income.new(income_params)

    if @income.save
      redirect_to overviews_index_path
    else
      render 'new'
    end
  end

  def update
    @income = Income.find(params[:id])
    if @income.update
      redirect_to overviews_index_path
    else
      render 'edit'
    end
  end

  def destroy
    @income = Income.destroy

    @income.destroy
    redirect_to overviews_index_path
  end

  def income_params
    params[:income].permit(:amountRound, :amountDecimal, :description)
  end
end
