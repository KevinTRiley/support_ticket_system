require 'spec_helper'

describe "recipients/new" do
  before(:each) do
    assign(:recipient, stub_model(Recipient,
      :name => "MyString",
      :email => "MyString"
    ).as_new_record)
  end

  it "renders new recipient form" do
    render

    assert_select "form[action=?][method=?]", recipients_path, "post" do
      assert_select "input#recipient_name[name=?]", "recipient[name]"
      assert_select "input#recipient_email[name=?]", "recipient[email]"
    end
  end
end
