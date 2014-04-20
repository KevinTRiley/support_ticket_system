require 'spec_helper'

describe SessionsController do

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      expect(response).to be_success
    end
  end

  describe "GET 'create'" do
    it "returns http success" do
      get 'create'
      expect(response).to redirect_to(login_url)
    end
    it "should login" do
      user = FactoryGirl.build(:user)
      post :create, user
      expect(response).to redirect_to(login_url)
      expect(user.id).to eq(session[:user_id])
    end
  end

  describe "GET 'destroy'" do
    it "returns http success" do
      get 'destroy'
      expect(response).to redirect_to(issues_url)
    end
  end

end
