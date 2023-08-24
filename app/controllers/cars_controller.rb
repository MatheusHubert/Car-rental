class CarsController < ApplicationController
  before_action :set_car, only: %I[show edit update]
  
    def index
    @cars = Car.all
    @cars = Car.search(params[:query]) if params[:query].present?
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

  def edit; end

  def update
    @car.update(update_car_params)
    @car.photos.concat(params[:photos]) unless params[:photos].nil?
    if @car.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_car
    @car = Car.find(params[:id])
  end

  def car_params
    params.require(:car).permit(:model, :price, :seat_number, :address, :description, photos: [])
  end

  def update_car_params
    params.require(:car).permit(:model, :price, :seat_number, :address, :description)
  end
end
