class BookingsController < ApplicationController
  before_action :set_restaurant
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  # GET /restaurants/:restaurant_id/bookings
  def index
    @bookings = @restaurant.bookings
  end

  # GET /restaurants/:restaurant_id/bookings/:id
  def show
  end

  # GET /restaurants/:restaurant_id/bookings/new
  def new
    @booking = @restaurant.bookings.new
  end

  # POST /restaurants/:restaurant_id/bookings
  def create
    @booking = @restaurant.bookings.new(booking_params)
    @booking.user = current_user

    if @booking.save
      redirect_to [@restaurant, @booking], notice: 'Booking was successfully created.'
    else
      render :new
    end
  end

  # GET /restaurants/:restaurant_id/bookings/:id/edit
  def edit
  end

  # PATCH/PUT /restaurants/:restaurant_id/bookings/:id
  def update
    if @booking.update(booking_params)
      redirect_to [@restaurant, @booking], notice: 'Booking was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /restaurants/:restaurant_id/bookings/:id
  def destroy
    @booking.destroy
    redirect_to restaurant_bookings_url(@restaurant), notice: 'Booking was successfully canceled.'
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def set_booking
    @booking = @restaurant.bookings.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:date, :time, :number_of_guests)
  end
end
