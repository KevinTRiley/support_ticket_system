require 'spec_helper'

describe "recipients/show" do
  before(:each) do
    @recipient = assign(:recipient, stub_model(Recipient,
      :name => "Name",
      :email => "Email"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Email/)
  end
end
