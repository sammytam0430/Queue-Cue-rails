class AddRestaurantNametoReservations < ActiveRecord::Migration[5.0]
  def change
    add_column :reservations, :restaurant_name, :string
  end
end
