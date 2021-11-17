class BookingsController < ApplicationController
  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.save
    redirect_to actor_path
  end

  def delete
    @booking.destroy
  end

  private

  def booking_params
    params.require(:booking).permit(:reviews, :actor_id)
  end

end
