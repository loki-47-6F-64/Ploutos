class FixedCost < ActiveRecord::Base
  attr_accessor :priority

  belongs_to :type

  validates :amount, :type_id, :frequency, presence: true
  validates :amount, numericality: { greater_than_or_equal_to: 0 }

  validates :type_id, numericality: { only_integer: true }

  validates :frequency, numericality: { greater_than: 0 }
  validates :priority, numericality: { greater_than_or_equal_to: 0, only_integer: true }, :on => :create

  has_many :bills, dependent: :destroy

  # Iterate over all unpaid bills
  def each_unpaid
    self.bills.each do |bill|
      unless bill.payed?
        yield bill
      end
    end
  end
end
