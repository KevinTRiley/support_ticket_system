require 'spec_helper'

describe "resolutions/new" do
  before(:each) do
    assign(:resolution, stub_model(Resolution,
      :issue_id => 1,
      :note => "MyText",
      :email_message => "MyText"
    ).as_new_record)
  end

  it "renders new resolution form" do
    render

    assert_select "form[action=?][method=?]", resolutions_path, "post" do
      assert_select "input#resolution_issue_id[name=?]", "resolution[issue_id]"
      assert_select "textarea#resolution_note[name=?]", "resolution[note]"
      assert_select "textarea#resolution_email_message[name=?]", "resolution[email_message]"
    end
  end
end
