require 'rails_helper'

RSpec.describe "Criterions", :type => :request do
  describe "GET /criterions" do
    it "works! (now write some real specs)" do
      get criterions_path
      expect(response).to have_http_status(200)
    end
  end
end
