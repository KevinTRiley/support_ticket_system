require 'spec_helper'

describe "Devices" do
  describe "GET /devices" do
    it "works! (now write some real specs)" do
      get devices_path
      expect(response.status).to be(302)
    end
  end
end
