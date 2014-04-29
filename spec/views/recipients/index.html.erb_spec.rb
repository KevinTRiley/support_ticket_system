require 'spec_helper'

describe "recipients/index" do
  before(:each) do
    assign(:recipients, [
      stub_model(Recipient,
        :name => "Name",
        :email => "Email"
      ),
      stub_model(Recipient,
        :name => "Name",
        :email => "Email"
      )
    ])
  end

  it "renders a list of recipients" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
  end
end
