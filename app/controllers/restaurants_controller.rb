class RestaurantsController < ApplicationController
  # this will render the parties that are in the queue for this particular restaurant
  def show
    queue_list = Reservation.where(restaurant_id: params[:id])
    render json: queue_list
  end

  def index
    restaurants = Restaurant.order(id: :desc)
    render json: restaurants
  end

  def create
    user = User.sign_up(params[:email], params[:password])
    restaurant = user.build_restaurant(restaurant_params)
    if restaurant.save
      render json: {
        token: user.auth_token
      }
    else
      render json: {errors: restaurant.errors.full_messages}
    end
  end

  private
  def restaurant_params
    params.require(:restaurants).permit(
      :name,
      :food_type,
      :location
    )
  end

  def user_params
    params.require(:restaurants).permit(
      :email,
      :password
    )
  end

end
