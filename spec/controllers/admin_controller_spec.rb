require 'spec_helper'

describe AdminController do

  describe "GET 'index'" do
    it "returns http redirect to login" do
      get 'index'
      expect(response).to redirect_to(login_url)
    end
  end

end
