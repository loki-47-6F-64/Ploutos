class FixedCosts < ActiveRecord::Base
  belongs_to :type

  #verify valid date
  validates :start, presence: true
  validates :end, presence: true

  # Make sure start is earlier than end.
  validate :startFirst

  validates :amountRound, numericality: { only_integer: true }
  validates :amountDecimal, :inclusion => 1...100

  validates :type_id, numericality: { only_integer: true }
  validates :frequency, numericality: { only_integer: true }

  def startFirst
    errors.add(:start, "must be before the end.") unless
      self.start < self.end
  end
end
