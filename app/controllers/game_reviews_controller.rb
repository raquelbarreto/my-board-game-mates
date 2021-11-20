class GameReviewsController < ApplicationController

  def create
    @game = Game.find(params[:game_id])
    @user = current_user
    @game_review = GameReview.new(game_review_params)
    @game_review.user = @user
    @game_review.game = @game
    authorize @game_review
    @game_reviews = GameReview
    if @game_review.save
      redirect_to game_path(@game)
    else
      render "games/show"
    end
  end

  def game_review_params
    params.require(:game_review).permit(:title, :content, :rating)
  end
end
