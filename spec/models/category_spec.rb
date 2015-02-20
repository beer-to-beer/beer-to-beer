require 'rails_helper'

RSpec.describe Category, :type => :model do
  let!(:category) { FactoryGirl.create(:category)}

  context 'should' do
    it 'be valid' do
      expect(category).to be_valid
    end
  end
end
