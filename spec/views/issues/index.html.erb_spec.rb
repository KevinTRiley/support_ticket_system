require 'spec_helper'

describe "issues/index" do
  before(:each) do
    assign(:issues, [
      stub_model(Issue,
        :description => "Description",
        :state => "State",
        :urgency => 0,
        :email => "test@email.com"
      ),
      stub_model(Issue,
        :description => "Description",
        :state => "State",
        :urgency => 0,
        :email => "test@email.com"
      )
    ])
  end

  it "renders a list of issues" do
    render
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
    assert_select "tr>td", :text => "0".to_s, :count => 2
  end
end
