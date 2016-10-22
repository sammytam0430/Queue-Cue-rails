require 'rails_helper'

RSpec.describe Reservation, type: :model do

  let(:customer) { Customer.new(name: 'Mickey', phone_number: '6041231234', email: 'mmouse@gmail.com') }

  let(:restaurant) { Restaurant.new(name: 'Miku', food_type: 'Sushi', location: 'Vancouver') }

  let(:reservation) {Reservation.new(party_size: '6', restaurant: restaurant, customer: customer)}

  describe 'Validations' do

    it "is valid with valid attributes" do
      reservation.save
      expect(reservation).to be_valid
    end

    # Party size should be required
    it "is not valid without a party size" do
      reservation.party_size = nil
      expect(reservation).to be_invalid
      expect(reservation.errors.size).to eql(2)
      expect(reservation.errors.full_messages).to include 'Party size can\'t be blank'
      expect(reservation.errors.full_messages).to include 'Party size is not a number'
    end

    # Restaurant should be required
    it "is not valid without a restaurant" do
      reservation.restaurant = nil
      expect(reservation).to be_invalid
      expect(reservation.errors.size).to eql(2)
      expect(reservation.errors.full_messages).to include 'Restaurant can\'t be blank'
      expect(reservation.errors.full_messages).to include 'Restaurant must exist'
    end

    # Customer should be required
    it "is not valid without a customer" do
      reservation.customer = nil
      expect(reservation).to be_invalid
      expect(reservation.errors.size).to eql(2)
      expect(reservation.errors.full_messages).to include 'Customer can\'t be blank'
      expect(reservation.errors.full_messages).to include 'Customer must exist'
    end

  end
end
