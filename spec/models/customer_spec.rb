require 'rails_helper'

RSpec.describe Customer, type: :model do
  context 'Validations' do
    let!(:customer) { Fabricate(:customer) }

    it "is valid with valid attributes" do
      expect(customer).to be_valid
    end

    # Name should be required
    context "without a name" do
      let(:customer) { Fabricate.build(:customer, name: nil) }

      it "is invalid" do
        expect(customer).to be_invalid
      end
      it "has 1 error message" do
        customer.valid?
        expect(customer.errors.size).to eql(1)
      end
      it "include 'Name can\'t be blank'" do
        customer.valid?
        expect(customer.errors.full_messages).to include 'Name can\'t be blank'
      end

    end

    # Phone number should be required
    context "without a phone number" do
      let!(:customer) { Fabricate.build(:customer, phone_number: nil) }

      it "is invalid" do
        expect(customer).to be_invalid
      end
      it "has 3 error message" do
        customer.valid?
        expect(customer.errors.size).to eql(3)
      end
      it "include 'Phone number can\'t be blank'" do
        customer.valid?
        expect(customer.errors.full_messages).to include 'Phone number can\'t be blank'
      end
      it "include 'Phone number is not a number'" do
        customer.valid?
        expect(customer.errors.full_messages).to include 'Phone number is not a number'
      end
      it "include 'Phone number is not a number'" do
        customer.valid?
        expect(customer.errors.full_messages).to include 'Phone number is the wrong length (should be 10 characters)'
      end

    end

    # Email should be required
    context "without a email" do
      let!(:customer) { Fabricate.build(:customer, email: nil) }

      it "is invalid" do
        expect(customer).to be_invalid
      end
      it "has 1 error message" do
        customer.valid?
        expect(customer.errors.size).to eql(1)
      end
      it "include 'Email can\'t be blank'" do
        customer.valid?
        expect(customer.errors.full_messages).to include 'Email can\'t be blank'
      end
    end

  end
end
