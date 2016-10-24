class RestaurantsController < ApplicationController

  def index
    @restaurant = Restaurant.order(id: :desc)
    render json: @restaurant
  end
end
