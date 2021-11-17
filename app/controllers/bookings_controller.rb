class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @actor = Actor.find(params[:actor_id])

  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @actor = Actor.find(params[:actor_id])
    @booking.actor = @actor
    @booking.save
    redirect_to actor_path
  end

  def delete
    @booking.destroy
  end

  private

  def booking_params
    params.require(:booking).permit(:reviews, :start_date, :end_date)
  end

end
