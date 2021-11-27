class UserReviewsController < ApplicationController
  def create
    @recepient = User.find(params[:user_id])
    @author = current_user
    @review = UserReview.new(user_review_params)
    @review.author = @author
    @review.recepient = @recepient
    authorize @review
    @recepient_reviews = UserReview.where(recepient: @recepient).order(created_at: :desc)
    if @review.save
      redirect_to user_path(@recepient)
    else
      render "users/show"
    end
  end

  private

  def user_review_params
    params.require(:user_review).permit(:title, :content, :rating)
  end
end
