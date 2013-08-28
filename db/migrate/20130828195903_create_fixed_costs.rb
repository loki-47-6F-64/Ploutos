class CreateFixedCosts < ActiveRecord::Migration
  def change
    create_table :fixed_costs do |t|
      t.references :type, index: true
      t.integer :amountRound
      t.integer :amountDecimal
      t.integer :frequency
      t.text :description

      t.timestamps
    end
  end
end
