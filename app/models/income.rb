class Income < ActiveRecord::Base
  def amount
    BigDecimal.new(amountRound.to_s) + BigDecimal.new(amountDecimal.to_s) / 100
  end

  validates :amountRound, numericality: { only_integer: true }
  validates :amountDecimal, :inclusion => 1...100
end
