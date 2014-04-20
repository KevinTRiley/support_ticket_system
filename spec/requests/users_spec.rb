require 'spec_helper'

describe "Users" do
  describe "GET /users" do
    it "works! (now write some real specs)" do
      get users_path
      expect(response.status).to be(302)
    end
  end
end
