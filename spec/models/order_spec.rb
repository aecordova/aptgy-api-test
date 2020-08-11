require 'rails_helper'

RSpec.describe School, type: :model do
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

    it 'Is not valid when breaches daily gift limit' do
       
    end
  end

end
