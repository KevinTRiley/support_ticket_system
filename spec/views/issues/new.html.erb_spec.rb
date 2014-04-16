require 'spec_helper'

describe "issues/new" do
  before(:each) do
    assign(:issue, stub_model(Issue,
      :description => "MyText",
      :state => "MyText",
      :urgecny => 0,
      :picture => File.new(File.join(Rails.root, 'spec', 'support', 'text-file-icon.png'))
    ).as_new_record)
  end

  it "renders new issue form" do
    render

    assert_select "form[action=?][method=?]", issues_path, "post" do
      assert_select "textarea#issue_description[name=?]", "issue[description]"
      assert_select "select#issue_state[name=?]", "issue[state]"
      assert_select "select#issue_urgency[name=?]", "issue[urgency]"
    end
  end
end
