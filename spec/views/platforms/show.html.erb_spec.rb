require 'spec_helper'

describe "platforms/show" do
  before(:each) do
    @platform = assign(:platform, stub_model(Platform,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
