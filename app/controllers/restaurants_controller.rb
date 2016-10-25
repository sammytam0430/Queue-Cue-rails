class RestaurantsController < ApplicationController

  def index
    restaurant = Restaurant.order(id: :desc)
    render json: restaurant
  end

  def create
    restaurant = Restaurant.new(restaurant_params)
    if restaurant.save
      render json: restaurant
    else
      render json: {errors: restaurant.errors.full_messages}
    end
  end

  def restaurant_params
    params.require(:restaurant).permit(
      :name,
      :food_type,
      :location
    )
  end

end
