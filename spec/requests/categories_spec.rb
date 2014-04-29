require 'spec_helper'

describe "Categories" do
  describe "GET /categories" do
    it "works! (now write some real specs)" do
      get categories_path
      expect(response.status).to be(302)
    end
  end
end
