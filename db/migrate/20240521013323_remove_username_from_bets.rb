class RemoveUsernameFromBets < ActiveRecord::Migration[7.1]
  def change
    remove_column :bets, :username, :string
  end
end
