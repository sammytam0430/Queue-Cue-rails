class RestaurantsController < ApplicationController
  # this will render the parties that are in the queue for this particular restaurant
  def show
    queue_list = Reservation.where(restaurant_id: params[:id])
    total_time = queue_list.sum('time_added')
    render json: {
      queue_list: queue_list,
      total_time: total_time
    }
  end

  def index
    reso_times = []
    restaurants = Restaurant.order(id: :desc)

    restaurants.each do |restaurant|
      total_time = restaurant.reservations.sum('time_added')
      reso_times.push({
        restaurant_id: restaurant.id,
        total_reso_time: total_time
      })
    end

    render json: restaurants.as_json(:include => :reservations)
    # render json: {
    #   restaurants: restaurants.as_json(:include => :reservations),
    #   time_array: reso_times
    # }
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
