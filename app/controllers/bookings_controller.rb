class BookingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new]
  before_action :set_restaurant, only: [:new, :create]

  def show
    @booking = Booking.find(params[:id])
  end

  def index
    @bookings = current_user.bookings
  end

  def new
    @booking = Booking.new
    # The restaurant is already set by the before_action
  end

  def create
    @booking = @restaurant.bookings.new(booking_params) # Assuming you have a relation set up
    @booking.user = current_user
    if @booking.save
      redirect_to booking_path(@booking), notice: 'Booking created successfully.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    booking = Booking.find(params[:id])
    booking.destroy
    redirect_to bookings_path, notice: 'Booking cancelled'
  end

  private

  def booking_params
    params.require(:booking).permit(:date) # Include any additional booking fields as needed
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
end
