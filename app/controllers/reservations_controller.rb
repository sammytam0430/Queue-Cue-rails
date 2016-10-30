class ReservationsController < ApplicationController

  def destroy
    Reservation.delete(params[:id])
  end

end
