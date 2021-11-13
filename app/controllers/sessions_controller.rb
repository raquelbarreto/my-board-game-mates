class SessionsController < ApplicationController
  def index
    @sessions = policy_scope(Session).order(created_at: :desc)
  end

  def new
    @session = Session.new
    authorize @session
  end

  def create
    @session = Session.new(session_params)
    @session.user = current_user
    authorize @session
    if @session.save
      redirect_to session_path(@session)
    else
      render :new
    end
  end

  def show
    @session = Session.find(params[:id])
    authorize @session
  end

  def edit
    @session = Session.find(params[:id])
    authorize @session
  end

  def update
    @session = Session.find(params[:id])
    authorize @session
    @session.update(session_params)
    redirect_to session_path(@session)
  end

  def destroy
    @session = Session.find(params[:id])
    authorize @session
    @session.destroy
    redirect_to sessions_path
  end

  private

  def session_params
    params.require(:session).permit(:session_name, :date, :time, :address, :is_smoke_free, :is_family_friendly, :has_drinks, :has_food, :capacity, :is_recurrent_boolean)
  end
end
