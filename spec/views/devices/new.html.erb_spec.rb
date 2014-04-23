require 'spec_helper'

describe "devices/new" do
  before(:each) do
    assign(:device, stub_model(Device,
      :name => "MyString",
      :issue => ""
    ).as_new_record)
  end

  it "renders new device form" do
    render

    assert_select "form[action=?][method=?]", devices_path, "post" do
      assert_select "input#device_name[name=?]", "device[name]"
      assert_select "input#device_issue[name=?]", "device[issue]"
    end
  end
end
