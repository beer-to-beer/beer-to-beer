require 'rails_helper'

RSpec.describe Producer, :type => :model do
  let!(:producer) { FactoryGirl.create(:producer)}

  context 'should' do
    it 'be valid' do
      expect(producer).to be_valid
    end
  end
end
