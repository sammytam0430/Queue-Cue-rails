class Reservation < ApplicationRecord
  belongs_to :restaurants
  belongs_to :customers 

  validates :party_size, presence: true

end
