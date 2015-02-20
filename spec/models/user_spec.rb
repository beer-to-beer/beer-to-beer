require 'rails_helper'

RSpec.describe User, :type => :model do
  let!(:user) { FactoryGirl.create(:user)}

  context 'should' do
    it 'be valid' do
      expect(user).to be_valid
    end
  end
end
