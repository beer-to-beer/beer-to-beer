require 'rails_helper'

RSpec.describe Criterion, :type => :model do
  let!(:rating1) { FactoryGirl.create(:rating)}
  let!(:criterion) { FactoryGirl.create(:criterion,name:"Price",rating_id: Rating.first.id)}
  context 'should' do
    it 'be valid and associated to Rating' do
      expect(criterion).to be_valid
    end
  end
end