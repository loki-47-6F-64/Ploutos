class CreateFixedCosts < ActiveRecord::Migration
  def change
    create_table :fixed_costs do |t|
      t.date :start
      t.date :end
      t.references :type, index: true
      t.decimal :costs
      t.text :description

      t.timestamps
    end
  end
end
