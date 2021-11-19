class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def dashboard
    @user = current_user
    @bookings_current_user = Booking.where(user: @user)
  end

  def new
    @booking = Booking.new
    @review = Review.new
  end
end
