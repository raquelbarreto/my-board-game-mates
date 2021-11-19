class LobbiesController < ApplicationController
  def create
    game_session = GameSession.find(params[:game_session_id])

    if current_user.lobbies.where(game_session: game_session).any?
      redirect_to game_session_path(game_session)
    end

    @lobby = Lobby.new
    @lobby.user = current_user
    @lobby.game_session = game_session
    authorize @lobby

    if @lobby.save
      redirect_to game_session_path(game_session)
    else
      render :new
    end
  end

  def destroy
    game_session = GameSession.find(params[:game_session_id])
    @lobby = Lobby.where(game_session: game_session, user: current_user).first
    authorize @lobby
    @lobby.delete
    redirect_to game_session_path(game_session)
  end
end
