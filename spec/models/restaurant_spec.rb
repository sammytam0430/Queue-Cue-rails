require 'rails_helper'

RSpec.describe Restaurant, type: :model do

  let(:restaurant) { Restaurant.new(name: 'Miku', food_type: 'Sushi', location: 'Vancouver') }

  describe 'Validations' do

    it "is valid with valid attributes" do
      expect(restaurant).to be_valid
    end

    # Name should be required
    it "is not valid without a name" do
      restaurant.name = nil
      expect(restaurant).to be_invalid
      expect(restaurant.errors.size).to eql(1)
      expect(restaurant.errors.full_messages).to include 'Name can\'t be blank'
    end

    # Food type should be required
    it "is not valid without a name" do
      restaurant.food_type = nil
      expect(restaurant).to be_invalid
      expect(restaurant.errors.size).to eql(1)
      expect(restaurant.errors.full_messages).to include 'Food type can\'t be blank'
    end

    # Location should be required
    it "is not valid without a location" do
      restaurant.location = nil
      expect(restaurant).to be_invalid
      expect(restaurant.errors.size).to eql(1)
      expect(restaurant.errors.full_messages).to include 'Location can\'t be blank'
    end

  end

end
