require 'rails_helper'

RSpec.describe Customer, type: :model do

  let(:customer) { Customer.new(name: 'Mickey', phone_number: '6041231234', email: 'mmouse@gmail.com') }

  describe 'Validations' do

    it "is valid with valid attributes" do
      expect(customer).to be_valid
    end

    # Name should be required
    it "is not valid without a name" do
      customer.name = nil
      expect(customer).to be_invalid
      expect(customer.errors.size).to eql(1)
      expect(customer.errors.full_messages).to include 'Name can\'t be blank'
    end

    # Phone number should be required
    it "is not valid without a phone number" do
      customer.phone_number = nil
      expect(customer).to be_invalid
      expect(customer.errors.size).to eql(3)
      expect(customer.errors.full_messages).to include 'Phone number can\'t be blank'
      expect(customer.errors.full_messages).to include 'Phone number is not a number'
      expect(customer.errors.full_messages).to include 'Phone number is the wrong length (should be 10 characters)'
    end

    it "is not valid without a phone number" do
      customer.email = nil
      expect(customer).to be_invalid
      expect(customer.errors.size).to eql(1)
      expect(customer.errors.full_messages).to include 'Email can\'t be blank'
    end

  end
end
