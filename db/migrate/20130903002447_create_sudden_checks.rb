class CreateSuddenChecks < ActiveRecord::Migration
  def change
    create_table :sudden_checks do |t|
      t.references :user, index: true
      t.date :when
      t.decimal :amount
      t.text :description
      t.integer :is_income
    end
  end
end
