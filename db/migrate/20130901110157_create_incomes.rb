class CreateIncomes < ActiveRecord::Migration
  def change
    create_table :incomes do |t|
      t.references :user, index: true
      t.integer :amountRound
      t.integer :amountDecimal
      t.text :description
    end
  end
end
