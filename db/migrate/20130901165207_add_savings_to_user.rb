class AddSavingsToUser < ActiveRecord::Migration
  def change
    add_column :users, :savings, :decimal
  end
end
