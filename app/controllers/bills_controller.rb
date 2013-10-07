class BillsController < ApplicationController
before_action :authenticate
before_action :prepare_all_bills, only: [:index]

include CustomContainer
  def prepare_all_bills
    @priority = LinkedList.new @current_user.fixed_costs

    @bills = []

    now = DateTime.now.to_date

    @current_user.fixed_costs.each do |fixed_cost|
      next_payment = fixed_cost.first_payment

      # Iterate all payments
      while ((next_payment <=> now) <= 0) do
        bill = fixed_cost.bills.find_or_create_by(
          added: next_payment)

        if bill.cost == nil
          bill.cost = fixed_cost.amount
          bill.save(:validate => false)
        end
        @bills.push bill

        next_payment = next_payment >> fixed_cost.frequency
      end #while
    end #each
  end

  def index
  end

  def pay
    return unless allow_view? params[:id]

    @bill.update params[:bill].permit(:when_payed)

    redirect_to due_payments_path
  end

  def allow_view? id
    @bill = Bill.find id
    @fixed_cost = FixedCost.find @bill.fixed_cost

    if @fixed_cost.user_id != @current_user.id
      render 'users/access_violation' and return false
    end
    return true
  end
end
