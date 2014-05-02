require 'spec_helper'

describe "Resolutions without authorization" do
  describe "GET /resolutions" do
    it "(now write some real specs)" do
      get resolutions_path
      expect(response.status).to be(302)
    end
  end
end
