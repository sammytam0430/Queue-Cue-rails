require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  context 'Validations' do
    let(:restaurant) { Fabricate(:restaurant) }

    it "is valid with valid attributes" do
      expect(restaurant).to be_valid
    end

    # Name should be required
    context "without a name" do
      let(:restaurant) { Fabricate.build(:restaurant, name: nil) }

      it "is invalid" do
        expect(restaurant).to be_invalid
      end
      it "has 1 error message" do
        restaurant.valid?
        expect(restaurant.errors.size).to eql(1)
      end
      it "include 'Name can\'t be blank'" do
        restaurant.valid?
        expect(restaurant.errors.full_messages).to include 'Name can\'t be blank'
      end

    end

    # Food type should be required
    context "without a name" do
      let(:restaurant) { Fabricate.build(:restaurant, food_type: nil) }

      it "is invalid" do
        expect(restaurant).to be_invalid
      end
      it "has 1 error message" do
        restaurant.valid?
        expect(restaurant.errors.size).to eql(1)
      end
      it "include 'Food type can\'t be blank'" do
        restaurant.valid?
        expect(restaurant.errors.full_messages).to include 'Food type can\'t be blank'
      end

    end

    # Location should be required
    context "without a name" do
      let(:restaurant) { Fabricate.build(:restaurant, location: nil) }

      it "is invalid" do
        expect(restaurant).to be_invalid
      end
      it "has 1 error message" do
        restaurant.valid?
        expect(restaurant.errors.size).to eql(1)
      end
      it "include 'Location can\'t be blank'" do
        restaurant.valid?
        expect(restaurant.errors.full_messages).to include 'Location can\'t be blank'
      end
    end

  end
end
