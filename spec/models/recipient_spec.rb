require 'rails_helper'

RSpec.describe Recipient, type: :model do
  describe 'associations' do
    it { should belong_to(:school) }
    it { should have_many(:orders) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:address) }
  end
end
