class GameSessionsController < ApplicationController
  def index
    @game_sessions = policy_scope(GameSession).order(created_at: :desc)

    @markers = @game_sessions.geocoded.map do |game_session|
      {
        lat: game_session.latitude,
        lng: game_session.longitude,
        info_window: render_to_string(partial: "info_window", locals: { game_session: game_session }),
        image_url: helpers.asset_url('marker')
      }
    end
  end

  def new
    @game_session = GameSession.new
    authorize @game_session
  end

  def create
    @game_session = GameSession.new(game_session_params)
    @game_session.user = current_user
    authorize @game_session
    if @game_session.save
      redirect_to game_sessions_path
    else
      render :new
    end
  end

  def show
    @game_session = GameSession.find(params[:id])
    @user = current_user
    @lobby = @user.lobbies.where(game_session: @game_session).first || Lobby.new
    authorize @game_session
  end

  def edit
    @game_session = GameSession.find(params[:id])
    authorize @game_session
  end

  def update
    @game_session = GameSession.find(params[:id])
    authorize @game_session
    @game_session.update(game_session_params)
    redirect_to game_session_path(@game_session)
  end

  def destroy
    @game_session = GameSession.find(params[:id])
    authorize @game_session
    @game_session.destroy
    redirect_to game_sessions_path
  end

  private

  def game_session_params
    params.require(:game_session).permit(:game_id, :session_name, :date, :time, :address, :is_smoke_free, :is_family_friendly, :has_drinks, :has_food, :capacity, :is_recurrent)
  end
end
