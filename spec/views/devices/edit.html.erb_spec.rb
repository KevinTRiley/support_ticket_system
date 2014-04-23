require 'spec_helper'

describe "devices/edit" do
  before(:each) do
    @device = assign(:device, stub_model(Device,
      :name => "MyString",
      :issue => ""
    ))
  end

  it "renders the edit device form" do
    render

    assert_select "form[action=?][method=?]", device_path(@device), "post" do
      assert_select "input#device_name[name=?]", "device[name]"
      assert_select "input#device_issue[name=?]", "device[issue]"
    end
  end
end
