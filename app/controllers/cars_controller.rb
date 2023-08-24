class CarsController < ApplicationController
  before_action :set_car, only: %I[show]

  def index
    @cars = Car.all
  end

  def new
    @car = Car.new

  end

  def create
    @car = Car.new(car_params)
    @car.user = current_user
    if @car.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end


  def show

    @markers = [{
        lat: @car.latitude,
        lng: @car.longitude,
      }]
    
  end

  private

  def set_car
    @car = Car.find(params[:id])
  end

  def car_params
    params.require(:car).permit(:model, :price, :seat_number, :address, :description, photos: [])
  end
end
