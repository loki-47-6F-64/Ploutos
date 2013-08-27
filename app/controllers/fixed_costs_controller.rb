class FixedCostsController < ApplicationController
  def new
    @fixed_cost = FixedCosts.new
    @types = Type.all
  end
  
  def create
    @fixed_cost = FixedCosts.new(params[:fixed_costs].permit(:start, :end, :typeCost, :cost, :description))

    if @fixed_cost.save
      redirect_to fixed_costs_path
    else
      @types = Type.all
      render 'new'
    end
  end
end
