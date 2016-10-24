require 'rails_helper'

RSpec.describe Reservation, type: :model do
  context 'Validations' do
    let(:reservation) { Fabricate(:reservation) }

    it "is valid with valid attributes" do
      expect(reservation).to be_valid
    end

    # Party size should be required
    context "without a party size" do
      let!(:reservation) { Fabricate.build(:reservation, party_size: nil) }

      it "is invalid" do
        expect(reservation).to be_invalid
      end
      it "has 2 error message" do
        reservation.valid?
        expect(reservation.errors.size).to eql(2)
      end
      it "include 'Party size can\'t be blank'" do
        reservation.valid?
        expect(reservation.errors.full_messages).to include 'Party size can\'t be blank'
      end
      it "include 'Party size is not a number''" do
        reservation.valid?
        expect(reservation.errors.full_messages).to include 'Party size is not a number'
      end

    end

    # Restaurant should be required
    context "without a restaurant" do
      let!(:reservation) { Fabricate.build(:reservation, restaurant: nil) }

      it "is invalid" do
        expect(reservation).to be_invalid
      end
      it "has 2 error message" do
        reservation.valid?
        expect(reservation.errors.size).to eql(2)
      end
      it "include 'Restaurant can\'t be blank'" do
        reservation.valid?
        expect(reservation.errors.full_messages).to include 'Restaurant can\'t be blank'
      end
      it "include 'Restaurant must exist''" do
        reservation.valid?
        expect(reservation.errors.full_messages).to include 'Restaurant must exist'
      end

    end

    # Customer should be required
    context "without a customer" do
      let!(:reservation) { Fabricate.build(:reservation, customer: nil) }

      it "is invalid" do
        expect(reservation).to be_invalid
      end
      it "has 2 error message" do
        reservation.valid?
        expect(reservation.errors.size).to eql(2)
      end
      it "include 'Customer can\'t be blank'" do
        reservation.valid?
        expect(reservation.errors.full_messages).to include 'Customer can\'t be blank'
      end
      it "include 'Customer must exist''" do
        reservation.valid?
        expect(reservation.errors.full_messages).to include 'Customer must exist'
      end
    end

  end
end
