class CarsController < ApplicationController
  before_action :set_car, only: %i[show]

  def show; end

  private

  def set_car
    @car = Car.find(params[:id])
  end
end
