class AddWinnerToBets < ActiveRecord::Migration[7.1]
  def change
    add_column :bets, :winner, :string
  end
end
