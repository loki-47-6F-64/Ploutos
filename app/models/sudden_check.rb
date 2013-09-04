class SuddenCheck < ActiveRecord::Base
  belongs_to :user

  validates :is_income, presence: true
  validate  :is_income_valid?

  validates :amount, presence: true
  validates :amount, numericality: { greater_than: 0 }

  def is_income_valid?
    unless self.is_income != nil && self.is_income.abs == 1
      errors.add(:is_income, 'is not equal to 1 or -1')
    end
  end
end
