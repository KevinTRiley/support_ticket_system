require 'spec_helper'

describe "Issues" do
  describe "GET /issues" do
    it "works! (now write some real specs)" do
      get issues_path
      expect(response.status).to be(200)
    end
  end
end
