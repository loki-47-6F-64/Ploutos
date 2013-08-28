class Income < ActiveRecord::Base
  def amount
    return BigDecimal.new(amountRound.to_s) + BigDecimal.new(amountDecimal.to_s) / 100
  end

  # Make sure start is earlier than end.
  validate :startFirst

  validates :amountRound, numericality: { only_integer: true }
  validates :amountDecimal, :inclusion => 1...100

  def startFirst
    errors.add(:start, "must be before the end.") unless
      self.start < self.end
  end
end
