require 'rails_helper'

RSpec.describe Club, :type => :model do
  let(:club) { FactoryGirl.create(:club)}

  context 'should' do
    it 'be valid' do
      expect(club).to be_valid
    end
  end
end