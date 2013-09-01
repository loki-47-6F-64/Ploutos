class CreateTypes < ActiveRecord::Migration
  def change
    create_table :types do |t|
      t.references :user, index: true
      t.string :name
    end
  end
end
