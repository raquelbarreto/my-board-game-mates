class UsersController < ApplicationController
  def show
    @recepient = User.find(params[:id])
    authorize @recepient
    @recepient_reviews = UserReview.where(recepient: @recepient).order(created_at: :desc)
    @review = UserReview.new
  end
end
