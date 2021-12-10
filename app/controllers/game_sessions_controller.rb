class GameSessionsController < ApplicationController
  def index
    if params[:query].present?
      @game_sessions = policy_scope(GameSession).joins(:game).where("games.name ILIKE ?", "%#{params[:query]}%")
    else
      @game_sessions = policy_scope(GameSession).order(date: :desc)
    end

    @markers = @game_sessions.geocoded.map do |game_session|
      {
        lat: game_session.latitude,
        lng: game_session.longitude,
        info_window: render_to_string(partial: "info_window", locals: { game_session: game_session }),
        image_url: helpers.image_url('marker.png')
      }
    end
  end

  def new
    @game_session = GameSession.new
    authorize @game_session
  end

  def create
    @game_session = GameSession.new(game_session_params)
    date = @game_session.date.to_datetime
    time = @game_session.start_time.to_datetime
    @game_session.starts_at = DateTime.new(date.year, date.month, date.day, time.hour, time.minute, time.second, 0)
    @game_session.user = current_user
    authorize @game_session
    if @game_session.save
      Lobby.create(game_session: @game_session, user: current_user, accepted: true)
      redirect_to game_session_path(@game_session)
    else
      render :new
    end
  end

  def show
    @game_session = GameSession.find(params[:id])
    @lobby = Lobby.where(game_session: @game_session, user: current_user).first || Lobby.new
    @markers = []
    @availability = @game_session.capacity - @game_session.lobbies.where(accepted: true).count
    authorize @game_session
    @session_data =
      {
        lat: @game_session.latitude,
        lng: @game_session.longitude,
        info_window: render_to_string(partial: "info_window", locals: { game_session: @game_session }),
        image_url: helpers.image_url('marker.png')
      }
    @markers.append(@session_data)
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
    params.require(:game_session).permit(:description, :photo, :game_id, :session_name, :date, :start_time, :address, :is_smoke_free, :is_family_friendly, :has_drinks, :has_food, :capacity, :is_recurrent)
  end
end
