class AddCompletedColumnToReservation < ActiveRecord::Migration[5.0]
  def change
    add_column :reservations, :completed, :boolean
  end
end
