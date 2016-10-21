class RestaurantsController < ApplicationController

  def index
    @restaurant = Restaurant.all.order(id: :asc)
    render json: @restaurant
  end
end
