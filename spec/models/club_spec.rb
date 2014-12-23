require 'rails_helper'

RSpec.describe Club, :type => :model do
  let!(:address) { FactoryGirl.create(:address)}
  let!(:club) { FactoryGirl.create(:club, address_id: Address.first.id)}

  context 'should' do
    it 'be valid' do
      expect(club).to be_valid
    end
  end
end