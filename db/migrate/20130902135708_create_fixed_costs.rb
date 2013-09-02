class CreateFixedCosts < ActiveRecord::Migration
  def change
    create_table :fixed_costs do |t|
      t.references :type, index: true
      t.references :user, index: true
      t.decimal :amount
      t.decimal :frequency
      t.text :description
    end
  end
end
