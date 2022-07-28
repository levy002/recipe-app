require 'rails_helper'

RSpec.describe Food, type: :model do
  describe 'Food model' do
    user = User.create(name: 'Debas', email: 'debas@example.com', password: '123456')
    subject { Food.new(user_id: user, name: 'Apple', measurement_unit: 'grams', unit_price: 5) }
    before { subject.save }

    it 'check the name is not blank' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'check if the name is not exceeding 20 characters' do
      subject.name = 'Hello world Hello world Hello world Hello world Hello world Hello world'
      expect(subject).to_not be_valid
    end

    it 'check the measurement unit is not blank' do
      subject.measurement_unit = nil
      expect(subject).to_not be_valid
    end

    it 'check if the measurement unit is not exceeding 10 characters' do
      subject.measurement_unit = 'Hello world Hello world Hello world'
      expect(subject).to_not be_valid
    end

    it 'check the price is not blank' do
      subject.unit_price = nil
      expect(subject).to_not be_valid
    end

    it 'check if price is numeric' do
      subject.unit_price = 'not-numeric'
      expect(subject).to_not be_valid
    end

    it 'check if price is equal or greater than one' do
      expect(subject.unit_price).to be >= 1
    end
  end
end
