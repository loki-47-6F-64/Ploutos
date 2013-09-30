class FixedCostsController < ApplicationController
before_action :authenticate
before_action :sort_priority, only: [:index, :create, :update, :destroy]

include CustomContainer
  def sort_priority
    @fixed_costs = @current_user.fixed_costs
    @priority = LinkedList.new @fixed_costs
  end

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
    @fixed_cost = @fixed_costs.build fixed_cost_params

    if @fixed_cost.save
      @priority.insert @fixed_cost, @fixed_cost.priority.to_i - 1

#      @priority.each_affected { |fixed_cost| fixed_cost.update fixed_cost.changed }

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
    parameters = fixed_cost_params
    if @fixed_cost.update parameters

      if parameters[:priority] != nil
        @priority.move @fixed_cost, parameters[:priority].to_i - 1
      end

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
    
    @priority.delete @fixed_cost
#    @priority.each_affected { |fixed_cost| fixed_cost.update fixed_cost.changed }

    @fixed_cost.destroy
    redirect_to fixed_costs_path
  end

  def fixed_cost_params
    parameters = params[:fixed_cost].permit(:type_id, :amount, :frequency, :priority, :description)
    if parameters[:priority] == nil
      parameters[:next] = nil
      parameters[:prev] = nil
    end

    return parameters
  end

  def allow_view? id
    @fixed_cost = FixedCost.find id

    if @fixed_cost.user_id != @current_user.id
      render 'users/access_violation' and return false
    end
    return true
  end
end
