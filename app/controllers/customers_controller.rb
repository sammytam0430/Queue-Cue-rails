class CustomersController < ApplicationController

  def index
    all_customers = Customer.order(:id)
    all_reservations = Reservation.order(:id)
    render json: {
      customers: all_customers,
      reservations: all_reservations
    }
  end

  def create
    new_customer = Customer.new(new_customer_params)
    new_reservation = Reservation.new(reservation_params)
    restaurant_name = Restaurant.find(new_reservation.restaurant_id).name
    if new_customer.save
      customer = new_customer.id
      new_reservation.customer_id = customer
      new_reservation.restaurant_name = restaurant_name
      new_reservation.save
      # render json: new_customer
      render json: new_reservation
    else
      render json: {errors: new_customer.errors.full_messages}
    end
  end

  def new_customer_params
    params.require(:customer).permit(
      :name,
      :phone_number,
      :email
    )
  end

  def reservation_params
    params.require(:reservation).permit(
      :party_size,
      :customer_id,
      :restaurant_id,
      :restaurant_name,
      :time_added,
      :completed
    )
  end



end
