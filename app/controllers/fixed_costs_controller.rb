class FixedCostsController < ApplicationController
  def new
    @fixed_cost = FixedCosts.new
    @types = Type.all
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
  def fixed_cost_params
    params[:fixed_costs].permit(:start, :end, :type_id, :amountRound, :amountDecimal, :description)
  end
end
