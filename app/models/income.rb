class Income < ActiveRecord::Base
  #verify valid date
  validates :start, presence: true
  validates :end, presence: true

  # Make sure start is earlier than end.
  validate :startFirst

  validates :amountRound, numericality: { only_integer: true }
  validates :amountDecimal, :inclusion => 1...100

  def startFirst
    errors.add(:start, "must be before the end.") unless
      self.start < self.end
  end
end
