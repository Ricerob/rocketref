class CreateBets < ActiveRecord::Migration[7.1]
  def change
    create_table :bets do |t|
      t.string :username
      t.float :bet
      t.string :game
      t.float :win_potential
      t.datetime :date

      t.timestamps
    end
  end
end
