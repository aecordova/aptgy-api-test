require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'associations' do
    it { should belong_to(:school) }
    it { should have_many(:items) }
    it { should have_many(:recipients).through(:items) }
  end

  describe 'validations' do
    it { should validate_presence_of(:school_id) }
    it { should validate_presence_of(:address) }
    it { should accept_nested_attributes_for(:items) }
    it { should define_enum_for(:status) }

    it 'Is not valid when order_item breaches daily gift limit' do
    end
    it 'is not valid when order_item breaches recipient limit' do
    end

    it 'is not valid when ir doesnt follow proper order flow' do
    end

    it 'flags order for notification to user when ORDER_SHIPPED' do
    end

    it 'doesnt allow updates when status is ORDER_SHIPPED' do
    end

    it 'doesnt allow updates when status is ORDER_CANCELLED' do
    end
  end

  describe 'methods' do
    it 'Calculates the gift count of an order' do
    end

    it 'Returns an array of distinct recipient_ids' do
    end

    it 'Counts the number of distinct recipients' do
    end
  end
end
