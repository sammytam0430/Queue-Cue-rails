class RestaurantsController < ApplicationController

  def index
    @restaurant = Restaurant.order(id: :desc)
    render json: @restaurant
  end

  def create
    puts params['restaurant']

    restaurant = Restaurant.new(restaurant_params)
    if restaurant.save
      puts 'YES SAVED'
    else
      puts 'NO FAILED'
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
