class FixedCostsController < ApplicationController
  def new
    @fixed_cost = FixedCosts.new
    @types = Type.all
  end
  
  def create
    @fixed_cost = FixedCosts.new(params[:fixed_cost].permit(:start, :end, :type, :cost, :description))

    if @fixed_cost.save
      redirect_to fixed_costs_path
    else
      render 'new'
    end
  end
end
