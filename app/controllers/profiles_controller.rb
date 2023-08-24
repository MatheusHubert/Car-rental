class ProfilesController < ApplicationController
  def show; end

  def cars
    @cars = current_user.cars
  end

  def my_bookings; end

  def destroy
    @car = Car.find(params[:id])
    @car.destroy
    redirect_to profile_cars_path(current_user.id)
  end
end
