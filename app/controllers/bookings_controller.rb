class BookingsController < ApplicationController
  before_action :set_restaurant

  def create
    @booking = @restaurant.bookings.new(booking_params)
    @booking.user = current_user

    if @booking.save
      redirect_to @restaurant, notice: "Your booking has been successfully made!"
    else
      redirect_to @restaurant, alert: "There was an error making your booking."
    end
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
