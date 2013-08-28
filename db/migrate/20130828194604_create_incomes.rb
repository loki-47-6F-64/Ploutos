class CreateIncomes < ActiveRecord::Migration
  def change
    create_table :incomes do |t|
      t.integer :amountRound
      t.integer :amountDecimal
      t.text :description

      t.timestamps
    end
  end
end
