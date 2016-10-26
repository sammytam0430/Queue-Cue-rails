class Reservation < ApplicationRecord
  belongs_to :restaurant
  belongs_to :customer

  validates :party_size, presence: true,
  numericality: { in: 1..6 }
  validates :restaurant, presence: true
  validates :customer, presence: true


end
