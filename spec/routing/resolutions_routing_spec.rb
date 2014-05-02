require "spec_helper"

describe ResolutionsController do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/resolutions").to route_to("resolutions#index")
    end

    it "routes to #new" do
      expect(:get => "/resolutions/new").to route_to("resolutions#new")
    end

    it "routes to #show" do
      expect(:get => "/resolutions/1").to route_to("resolutions#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/resolutions/1/edit").to route_to("resolutions#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/resolutions").to route_to("resolutions#create")
    end

    it "routes to #update" do
      expect(:put => "/resolutions/1").to route_to("resolutions#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/resolutions/1").to route_to("resolutions#destroy", :id => "1")
    end

  end
end
