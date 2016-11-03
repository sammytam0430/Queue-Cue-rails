class ReservationsController < ApplicationController

  def destroy
    if params[:customer_id]
      customer = Customer.find(params[:customer_id])
      TableReadyJob.perform_later(customer.phone_number)
      Reservation.delete(params[:id])
    else
      Reservation.delete(params[:id])
    end
  end

end
