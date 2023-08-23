class BookingsController < ApplicationController

  def index
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    if @booking.save
      redirect_to new_car_booking_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  private

  def set_car
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:car).permit(:start_date, :end_date)
  end
end
