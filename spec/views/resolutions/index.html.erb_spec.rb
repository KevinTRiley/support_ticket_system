require 'spec_helper'

describe "resolutions/index" do
  before(:each) do
    assign(:resolutions, [
      stub_model(Resolution,
        :issue_id => 1,
        :note => "MyText",
        :email_message => "MyText"
      ),
      stub_model(Resolution,
        :issue_id => 1,
        :note => "MyText",
        :email_message => "MyText"
      )
    ])
  end

  it "renders a list of resolutions" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 4
    assert_select "tr>td", :text => "MyText".to_s, :count => 4
  end
end
