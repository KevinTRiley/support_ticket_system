require 'spec_helper'

describe "resolutions/show" do
  before(:each) do
    @resolution = assign(:resolution, stub_model(Resolution,
      :issue_id => 1,
      :note => "MyText",
      :email_message => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
  end
end
