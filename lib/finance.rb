module Finance

#require 'bigdecimal'
# total_income=x
# fixed_costs=y
# to_save=z
# money_left=(x - z)*(1 - z/100)
# spendable=money_left + sudden_income
 
class Status
  attr_accessor :income, :cost, :savings, :sudden_income

  def initialize user
    self.income = user.incomes
    self.cost = user.fixed_costs
    self.sudden_income = user.sudden_checks

    @savings = user.savings
  end

  def income= incomes
    @income = BigDecimal.new '0'

    incomes.each do |income|
      @income += income.amount
    end
  end

  def cost= costs
    @cost = BigDecimal.new '0'

    costs.each do |cost|
      @cost += cost.amount / cost.frequency
    end
  end

  def sudden_income= sudden_checks
    @sudden_income = BigDecimal.new '0'

    sudden_checks.each do |sudden_check|
      if sudden_check.when.year == Time.now.year && sudden_check.when.month == Time.now.month
        @sudden_income += sudden_check.amount * sudden_check.is_income
      end
    end
  end

  def spendable
    return ((@income - @cost)*(1 - @savings / 100) + @sudden_income).round 2
  end
end
end #module
