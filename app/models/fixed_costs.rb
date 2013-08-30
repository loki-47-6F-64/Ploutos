class FixedCosts < ActiveRecord::Base
  def amount
    return BigDecimal.new(amountRound().to_s) + BigDecimal.new(amountDecimal.to_s) / 100
  end

  belongs_to :type

  validates :amountRound, numericality: { only_integer: true }
  validates :amountDecimal, :inclusion => 1...100

  validates :type_id, numericality: { only_integer: true }
  validates :frequency, numericality: { only_integer: true }
end
