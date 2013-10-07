class CreateBills < ActiveRecord::Migration
  def change
    create_table :bills do |t|
      t.decimal :cost
      t.date :added
      t.date :when_payed
      t.references :fixed_cost, index: true

      t.timestamps
    end
  end
end
