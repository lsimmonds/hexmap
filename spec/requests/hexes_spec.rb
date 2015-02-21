require 'rails_helper'

RSpec.describe "Hexes", type: :request do
  describe "GET /hexes" do
    it "works! (now write some real specs)" do
      get hexes_path
      expect(response).to have_http_status(200)
    end
  end
end
