class Restaurant < ApplicationRecord
  has_many :reservations
  belongs_to :user

  validates :name, presence: true
  validates :food_type, presence: true
  validates :location, presence: true

end
