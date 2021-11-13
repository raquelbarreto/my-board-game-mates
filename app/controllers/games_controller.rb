class GamesController < ApplicationController
  before_action :set_and_authorize_game, except: %i[index new create]
  def index
    @games = policy_scope(Game).order(created_at: :desc)
  end

  def new
    @game = Game.new
    authorize @game
  end

  def create
    @game = Game.new(game_params)
    authorize @game
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

  def set_and_authorize_game
    @game = Game.find(params[:id])
    authorize @game
  end

  def game_params
    params.require(:game).permit(:name, :description, :age_rating, :player_count, :category, :duration)
  end
end
