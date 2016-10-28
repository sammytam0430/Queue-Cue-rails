class AddTimeToReservations < ActiveRecord::Migration[5.0]
  def change
    add_column :reservations, :time_added, :integer
  end
end
