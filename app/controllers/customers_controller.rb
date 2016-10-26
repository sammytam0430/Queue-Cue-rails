class CustomersController < ApplicationController

  def create
    new_customer = Customer.new(new_customer_params)
    new_reservation = Reservation.new(reservation_params)
    if new_reservation.save
      # render json: new_customer
      render json: new_reservation
    else
      render json: {errors: new_reservation.errors.full_messages}
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
      :restaurant_id
    )
  end



end
