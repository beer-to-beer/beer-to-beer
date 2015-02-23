require 'rails_helper'


RSpec.describe Event, :type => :model do
  let!(:address) { FactoryGirl.create(:address)}
  let!(:club) { FactoryGirl.create(:club, address_id: Address.first.id)}
  #let(:events) { FactoryGirl.build(:event, club_id: Club.first.id)}

  context 'needs a club' do
    it 'is not valid without a club' do

      expect(FactoryGirl.build(:event, club_id: nil)).to_not be_valid
    end

    it 'is valid with a club' do
      expect(FactoryGirl.build(:event, club_id: Club.first.id)).to be_valid
    end
  end
end