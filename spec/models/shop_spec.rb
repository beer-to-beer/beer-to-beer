require 'rails_helper'

RSpec.describe Shop, :type => :model do
  let!(:shop) { FactoryGirl.create(:shop)}

  context 'should' do
    it 'be valid' do
      expect(shop).to be_valid
    end
  end
end
