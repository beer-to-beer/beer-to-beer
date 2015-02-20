require 'rails_helper'

RSpec.describe Beer, :type => :model do
  let!(:beer) { FactoryGirl.create(:beer)}

  context 'should' do
    it 'be valid' do
      expect(beer).to be_valid
    end
  end
end
