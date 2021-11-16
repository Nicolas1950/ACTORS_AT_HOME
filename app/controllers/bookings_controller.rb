class BookingsController < ApplicationController
  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.list = @list
  end

  private

  def booking_params
    params.require(:booking).permit(:reviews, :actor_id)
  end

end
