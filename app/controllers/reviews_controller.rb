class ReviewsController < ApplicationController
  def index
  end

  def new
    @booking = Booking.find(params[:booking_id])
    @review = Review.new
    authorize @review
  end

  def create
    @review = Review.new(review_params)
    @user = current_user
    @booking = Booking.find(params[:booking_id])
    @actor = @booking.actor
    @review.booking = @booking
    @review.save
    redirect_to actor_path(@actor)
    authorize @review
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    authorize @review
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end
