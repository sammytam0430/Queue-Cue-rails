class Customer < ApplicationRecord
  has_many :reservations

  validates :name, presence: true
  validates :phone_number,
      presence: true,
      numericality:  true,
      length: { is: 10 }
  validates :email, presence: true

end
