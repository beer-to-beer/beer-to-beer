require 'rails_helper'

RSpec.describe Event, :type => :model do
  let(:event) { FactoryGirl.create(:event, club_id: Club.first.id)}

  context 'needs a club' do
    it 'is not valid without a club' do
      event.club_id = nil
      expect(event).to_not be_valid
    end

    it 'is valid with a club' do
      expect(event).to be_valid
    end
  end
end