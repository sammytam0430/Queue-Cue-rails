class Customer < ApplicationRecord
  has_one :reservation

  validates :name, presence: true
  validates :phone_number, presence: true
  validates :email, presence: true

end
