require 'spec_helper'

describe "issues/index" do
  before(:each) do
    assign(:issues, [
      stub_model(Issue,
        :description => "Description",
        :state => "State",
        :urgency => 0,
        :email => "test@email.com",
        :device_id => 1,
        :platform_id => 1,
        :category_id => 1
      ),
      stub_model(Issue,
        :description => "Description",
        :state => "State",
        :urgency => 0,
        :email => "test@email.com",
        :device_id => 1,
        :platform_id => 1,
        :category_id => 1
      )
    ])
  end

  before(:each) do
    assign(:platforms, [
      stub_model(Platform,
        :name => "PlatName"
      ),
      stub_model(Platform,
        :name => "PlatName2"
      )
    ])
  end

  it "Without a device accociated with the issue cannot render a list of issues" do
    render
    assert_select "tr>td", :text => "Description".to_s, :count => 0
    assert_select "tr>td", :text => "State".to_s, :count => 0
    assert_select "tr>td", :text => "0".to_s, :count => 0
  end
end
