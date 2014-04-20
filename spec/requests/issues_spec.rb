require 'spec_helper'

describe "Issues" do
  describe "GET /issues" do
    it "works! (now write some real specs)" do
      get issues_path
      expect(response.status).to be(302)
        expect(response).to redirect_to(login_url)
    end
  end
end
