class AddCustomerRefToReservations < ActiveRecord::Migration[5.0]
  def change
    add_reference :reservations, :customer, index: true, foreign_key: true
  end
end
