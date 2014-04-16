require 'spec_helper'

describe "issues/index" do
  before(:each) do
    assign(:issues, [
      stub_model(Issue,
        :description => "MyText"
      ),
      stub_model(Issue,
        :description => "MyText"
      )
    ])
  end

  it "renders a list of issues" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
