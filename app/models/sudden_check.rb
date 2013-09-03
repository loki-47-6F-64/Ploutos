class SuddenCheck < ActiveRecord::Base
  belongs_to :user

  validate :is_income_valid?
  validates :amount, presence: true
  validates :amount, numericality: { greater_than: 0 }

  def is_income_valid?
    return self.is_income.abs == 1
  end
end
