class FixedCostsController < ApplicationController
  def new
    @types = Type.all
  end
  
  def create
    @fixed_cost = FixedCosts.new(params[:post])

    if @fixed_cost.save
      redirect_to fixed_costs_path
    else
      render 'new'
    end
  end
end
