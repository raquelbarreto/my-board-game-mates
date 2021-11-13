class GamesController < ApplicationController
  before_action :set_game, except: %i[index new create]
  def index
    @games = policy_scope(Game).order(created_at: :desc)
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    if @game.save
      redirect_to games_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @game.update(game_params)
    redirect_to games_path
  end

  def destroy
    @game.destroy
    redirect_to games_path
  end

  private

  def set_game
    @game = Game.find(params[:id])
  end

  def game_params
    params.require(:game).permit(:name, :description, :age_rating, :player_count, :category, :duration)
  end
end
