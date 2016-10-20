class Restaurant < ApplicationRecord
  has_many :reservations

  validates :name, presence: true
  validates :food_type, presence: true
  validates :location, presence: true

end
