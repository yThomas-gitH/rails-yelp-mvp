class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(verif_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  private

  def verif_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end
end
