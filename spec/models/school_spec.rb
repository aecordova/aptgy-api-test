require 'rails_helper'

RSpec.describe School, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:address) }
  end

  describe 'associations' do
    it { should have_many(:recipients) }
    it { should have_many(:orders) }
  end

  describe 'methods' do
    let(:school) { School.create(name: 'School1', address: 'Address1') }

    it 'Retrieves the orders from a school in a given date ' do
    end

    it 'Counts the number of gifts order for a given date' do
    end
  end
end
