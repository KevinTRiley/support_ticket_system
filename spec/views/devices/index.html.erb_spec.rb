require 'spec_helper'

describe "devices/index" do
  before(:each) do
    assign(:devices, [
      stub_model(Device,
        :name => "Name"
      ),
      stub_model(Device,
        :name => "Name"
      )
    ])
  end

  it "Without an issue accoiated with the device - cannot render a list of devices" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 0
  end
end
