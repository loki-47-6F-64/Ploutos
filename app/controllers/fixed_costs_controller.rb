class FixedCostsController < ApplicationController
  def new
    @fixed_cost = FixedCosts.new
    @types = Type.all
  end
  
  def edit
    @fixed_cost = FixedCosts.find(params[:id])
    @types = Type.all
  end

  def index
    @fixed_costs = FixedCosts.all
  end

  def show
    @fixed_cost = FixedCosts.find params[:id]
  end

  def create
    @fixed_cost = FixedCosts.new(fixed_cost_params)

    if @fixed_cost.save
      redirect_to fixed_costs_path
    else
      @types = Type.all
      render 'new'
    end
  end

  def update
    @fixed_cost = FixedCosts.find(params[:id])

    if @fixed_cost.update fixed_cost_params
      redirect_to fixed_costs_path
    else
      render 'edit'
    end
  end

  def destroy
    @fixed_cost = FixedCosts.find(params[:id])

    @fixed_cost.destroy
    redirect_to fixed_costs_path
  end

  def fixed_cost_params
    params[:fixed_costs].permit(:type_id, :amountRound, :amountDecimal, :frequency, :description)
  end
end
