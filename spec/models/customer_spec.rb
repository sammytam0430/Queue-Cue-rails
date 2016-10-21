require 'rails_helper'

RSpec.describe Customer, type: :model do

  let(:customer) { Customer.new(first_name: 'Mickey', last_name: 'Mouse', email: 'mmouse@disney.com', password: '123456', password_confirmation: '123456') }

  describe 'Validations' do

    it "is valid with valid attributes" do
      expect(customer).to be_valid
    end

  end
end
