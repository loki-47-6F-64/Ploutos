class CreateIncomes < ActiveRecord::Migration
  def change
    create_table :incomes do |t|
      t.references :user, index: true
      t.decimal :amount
      t.text :description
    end
  end
end
