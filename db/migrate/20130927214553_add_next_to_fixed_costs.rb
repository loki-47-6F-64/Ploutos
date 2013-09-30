class AddNextToFixedCosts < ActiveRecord::Migration
  def change
    add_column :fixed_costs, :next, :fixed_costs
    add_column :fixed_costs, :prev, :fixed_costs
  end
end
