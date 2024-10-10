class BookingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new]
  before_action :set_restaurant, only: [:new, :create]

  def new
    @booking = Booking.new
    # The restaurant is already set by the before_action
  end

  def create
    @booking = @restaurant.bookings.new(booking_params) # Assuming you have a relation set up
    if @booking.save
      redirect_to booking_path(@booking), notice: 'Booking created successfully.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:date) # Include any additional booking fields as needed
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
end
