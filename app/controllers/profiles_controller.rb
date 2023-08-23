class ProfilesController < ApplicationController
  def show; end

  def cars
    @cars = current_user.cars
  end
end
