class AddSharedWithToBets < ActiveRecord::Migration[7.1]
  def change
    add_column :bets, :shared_with, :integer, array: true, default: []
  end
end
