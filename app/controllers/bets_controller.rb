class BetsController < ApplicationController

  before_action :authenticate_user!, except: [:index]

  def index
    @bets = Bet.all
  end

  def show
    @bet = Bet.find(params[:id])

    # Check if @bet.shared_with array contains current_user, OR current_user = user_id

    # If not, redirect to home.
  end

  def new
    @games = [
      { title: "Dallas @ Minnesota, Game 1", odds: 1.5, date: "2024-05-21", winners: ["Dallas", "Minnesota"] },
      { title: "Dallas @ Minnesota, Game 2", odds: 2.0, date: "2024-05-23", winners: ["Dallas", "Minnesota"] },
      { title: "Minnesota @ Dallas, Game 3", odds: 2.5, date: "2024-05-24", winners: ["Dallas", "Minnesota"] }
    ]
    @winners = ["Dallas", "Minnesota"]
    @bet = current_user.bets.build
  end

  def create
    @bet = current_user.bets.build(bet_params)

    if @bet.save
      redirect_to @bet
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @games = [
      { title: "Dallas @ Minnesota, Game 1", odds: 1.5, date: "2024-05-21", winners: ["Dallas", "Minnesota"] },
      { title: "Dallas @ Minnesota, Game 2", odds: 2.0, date: "2024-05-23", winners: ["Dallas", "Minnesota"] },
      { title: "Minnesota @ Dallas, Game 3", odds: 2.5, date: "2024-05-24", winners: ["Dallas", "Minnesota"] }
    ]
    @winners = ["Dallas", "Minnesota"]

    @bet = current_user.bets.find(params[:id])
  end

  def update 
    @bet = Bet.find(params([:id]))

    if @bet.update(bet_params)
      redirect_to @bet
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @bet = Bet.find(params[:id])
    @bet.destroy

    redirect_to root_path
  end

  private
    def bet_params
      params.require(:bet).permit(:bet, :game, :win_potential, :date, :winner, :user_id)
    end

end
