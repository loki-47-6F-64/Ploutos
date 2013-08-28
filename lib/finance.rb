module Finance

#require 'bigdecimal'
# total_income=x
# fixed_costs=y
# to_save=z
# money_left=(x - z)*(1 - z/100)

def money_left(incomes, fixed_costs)
  total_income = BigDecimal.new('0')
  incomes.each do |income|
    total_income += income.amount
  end

  total_fixed_cost = BigDecimal.new('0')
  fixed_costs.each do |fixed_cost|
    total_fixed_cost += fixed_cost.amount / fixed_cost.frequency
  end

  return total_income - total_fixed_cost
end


end #module
