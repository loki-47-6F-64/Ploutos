class FixedCostsController < ApplicationController
before_action :authenticate
  def new
    @fixed_cost = @current_user.fixed_costs.build
    @types = @current_user.types
  end
  
  def edit
    return unless allow_view? params[:id]

    @types = @current_user.types
  end

  def index
    @fixed_costs = @current_user.fixed_costs
  end

  def show
    return unless allow_view? params[:id]
  end

  def create
    @fixed_cost = @current_user.fixed_costs.build fixed_cost_params

    if @fixed_cost.save
      notify :success, 'Fixed Cost added successfully.', true

      redirect_to fixed_costs_path
    else
      notify :error, @fixed_cost.errors.full_messages

      @types = @current_user.types
      render 'new'
    end
  end

  def update
    return unless allow_view? params[:id]

    if @fixed_cost.update fixed_cost_params
      notify :success, 'Fixed Cost updated successfully.', true

      redirect_to fixed_costs_path
    else
      notify :error, @fixed_cost.errors.full_messages

      @types = @current_user.types
      render 'edit'
    end
  end

  def destroy
    return unless allow_view? params[:id]

    notify :info, 'Fixed Cost deleted.', true

    @fixed_cost.destroy
    redirect_to fixed_costs_path
  end

  def fixed_cost_params
    params[:fixed_cost].permit(:type_id, :amountRound, :amountDecimal, :frequency, :description)
  end

  def allow_view? id
    @fixed_cost = FixedCost.find id

    if @fixed_cost.user_id != @current_user.id
      render 'users/access_violation' and return false
    end
    return true
  end
end
