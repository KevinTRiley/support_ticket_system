require 'spec_helper'

describe "devices/index" do
  before(:each) do
    assign(:devices, [
      stub_model(Device,
        :name => "Name",
        :issue => ""
      ),
      stub_model(Device,
        :name => "Name",
        :issue => ""
      )
    ])
  end

  it "renders a list of devices" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
