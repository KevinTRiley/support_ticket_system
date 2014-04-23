require 'spec_helper'

describe "devices/show" do
  before(:each) do
    @device = assign(:device, stub_model(Device,
      :name => "Name",
      :issue => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(//)
  end
end
