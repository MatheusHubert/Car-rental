class BookingsController < ApplicationController
  before_action :set_booking, only: %I[show destroy]

  def index
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new
    @car = Car.find(params[:car_id])
  end

  def create
    @car = Car.find(params[:car_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.car = @car

    if @booking.save
      redirect_to new_car_booking_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show; end

  def destroy
    @booking.destroy
    redirect_to profile_bookings_path(current_user.id)
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
