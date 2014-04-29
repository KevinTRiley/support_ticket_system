require 'spec_helper'

describe "recipients/edit" do
  before(:each) do
    @recipient = assign(:recipient, stub_model(Recipient,
      :name => "MyString",
      :email => "MyString"
    ))
  end

  it "renders the edit recipient form" do
    render

    assert_select "form[action=?][method=?]", recipient_path(@recipient), "post" do
      assert_select "input#recipient_name[name=?]", "recipient[name]"
      assert_select "input#recipient_email[name=?]", "recipient[email]"
    end
  end
end
