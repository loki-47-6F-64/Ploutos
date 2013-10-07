class AddFirstPaymentToFixedCosts < ActiveRecord::Migration
  def change
    add_column :fixed_costs, :first_payment, :date
  end
end
