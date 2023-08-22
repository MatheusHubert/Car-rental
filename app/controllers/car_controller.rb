class CarController < ApplicationController
  before_action :set_car, only: %I[show]


  def index
    @cars = Car.all
  end

  def show
  end
end

private

def set_car
  @car = Car.find(params[:id])
end

def car_params
  params.require(:car).permit(:model, :price, :number_seat)
end
