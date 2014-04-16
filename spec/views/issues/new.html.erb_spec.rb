require 'spec_helper'

describe "issues/new" do
  before(:each) do
    assign(:issue, stub_model(Issue,
      :description => "MyText"
    ).as_new_record)
  end

  it "renders new issue form" do
    render

    assert_select "form[action=?][method=?]", issues_path, "post" do
      assert_select "textarea#issue_description[name=?]", "issue[description]"
    end
  end
end
