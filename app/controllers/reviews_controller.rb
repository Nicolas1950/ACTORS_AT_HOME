class ReviewsController < ApplicationController
  def index
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @actor = Actor.find(params[:actor_id])
    @user = current_user
    @booking = Booking.where(actor: @actor, user: @user)
    @review.booking = @booking
    @review.save
    redirect_to actor_path(@actor)
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
  end

  private

  def review_params
    params.require(:review).permit(:)

end



  @booking = Booking.new(booking_params)
  @booking.user = current_user
  @booking.save
  redirect_to actor_path(@actor)
  end

  private

  def review_params
    params.require(:review).permit(:, :actor_id)
  end
