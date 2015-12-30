require 'rails_helper'

RSpec.describe "Clothings", type: :request do
  describe "GET /clothings" do
    it "works! (now write some real specs)" do
      get clothings_path
      expect(response).to have_http_status(200)
    end
  end
end
