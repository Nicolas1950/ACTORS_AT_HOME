class ReviewsController < ApplicationController
  def index
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.booking =
    @
  end

  def destroy
  end
end



  @booking = Booking.new(booking_params)
  @booking.user = current_user
  @booking.save
  redirect_to actor_path(@actor)
  end

  private

  def booking_params
    params.require(:booking).permit(:reviews, :actor_id)
  end
