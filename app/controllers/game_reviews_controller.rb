class GameReviewsController < ApplicationController

  def create
    @game = Game.find(params[:game_id])
    @user = current_user
    @review= GameReview.new(game_review_params)
    @review.user = @user
    @review.game = @game
    authorize @review
    @game_reviews = GameReview.where(game: @game).order(created_at: :desc)
    if @review.save
      redirect_to game_path(@game)
    else
      render "games/show"
    end
  end

  def game_review_params
    params.require(:game_review).permit(:title, :content, :rating)
  end
end
