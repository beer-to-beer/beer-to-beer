require 'rails_helper'

RSpec.describe Rating, :type => :model do
  let!(:rating1) { FactoryGirl.create(:rating)}

  context 'should' do
    it 'be valid' do
      expect(rating1).to be_valid
    end
  end
end