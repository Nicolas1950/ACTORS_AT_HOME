class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @actor = Actor.find(params[:actor_id])
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @actor = Actor.find(params[:actor_id])
    @booking.actor = @actor
    @booking.save
    redirect_to actor_path(@actor)
    authorize @booking
  end

  def destroy
    @booking.destroy
    authorize @booking
  end

  private

  def booking_params
    params.require(:booking).permit(:actor_id, :user_id, :start_date, :end_date)
  end
end
