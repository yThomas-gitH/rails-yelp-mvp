class ReviewsController < ApplicationController
  def new
    @restaurant = Restaurant.find(params[:id])
    @review = Review.new
  end

  def create
    @review = Review.new(verif_params)
    @review.restaurant = Restaurant.find(params[:id])
    if @review.save
      redirect_to restaurant_path(params[:id])
    else
      render :new
  end

  end

  private

  def verif_params
    params.require(:review).permit(:content, :rating)
  end
end
