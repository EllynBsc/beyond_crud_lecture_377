class ReviewsController < ApplicationController
  def new #GET REQUEST
    # raise
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create #POST REQUEST
    #1. I m creating a review with th info/params of the user
    @review = Review.new(reviews_params)
    # 2.I need to attach this review to the restaurant_id
      # 2.1 For that I need to find the restaurant for which i create/want to attach a review
    @restaurant = Restaurant.find(params[:restaurant_id])
      # 2.1 And then I assign this restaurant to the review im creating
    @review.restaurant  = @restaurant
    # @review.restaurant_id  = @restaurant.id
    # raise
      if @review.save
        redirect_to restaurant_path(@restaurant)
      else
        render :new #render is the method to render an action
      end
  end

  private

  def reviews_params
    params.require(:review).permit(:content, :rating)
  end
end
