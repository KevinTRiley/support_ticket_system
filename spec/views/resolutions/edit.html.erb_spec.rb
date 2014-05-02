require 'spec_helper'

describe "resolutions/edit" do
  before(:each) do
    @resolution = assign(:resolution, stub_model(Resolution,
      :issue_id => 1,
      :note => "MyText",
      :email_message => "MyText"
    ))
  end

  it "renders the edit resolution form" do
    render

    assert_select "form[action=?][method=?]", resolution_path(@resolution), "post" do
      assert_select "input#resolution_issue_id[name=?]", "resolution[issue_id]"
      assert_select "textarea#resolution_note[name=?]", "resolution[note]"
      assert_select "textarea#resolution_email_message[name=?]", "resolution[email_message]"
    end
  end
end
