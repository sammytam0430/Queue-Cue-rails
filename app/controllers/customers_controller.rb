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
      time = Restaurant.find(new_reservation.restaurant_id).reservations.sum('time_added')
      puts "total time"
      puts time
      # ExampleJob.set(wait_until: new_customer.created_at + (time - 10)*60).perform_later(new_customer.phone_number)
      MakeReservationJob.perform_later(new_customer.phone_number, time, new_reservation.restaurant_name)
      render json: {
        new_reservation: new_reservation,
        new_customer: new_customer
      }
    else
      render json: {errors: new_customer.errors.full_messages}
    end
  end

  def destroy
    Customer.delete(params[:id])
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
