class FixedCost < ActiveRecord::Base
  belongs_to :type

  validates :amount, :type_id, :frequency, presence: true
  validates :amount, numericality: { greater_than_or_equal_to: 0 }

  validates :type_id, numericality: { only_integer: true }

  validates :frequency, numericality: { greater_than: 0 }
end
