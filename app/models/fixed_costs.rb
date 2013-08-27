class FixedCosts < ActiveRecord::Base
  belongs_to :type

  #verify valid date
  validates :start, presence: true
  validates :end, presence: true

  # Make sure start is earlier than end.
  validate :startFirst

  def startFirst
    errors.add(:start, "must be before the end.") unless
      self.start < self.end
  end
end
