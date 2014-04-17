require 'spec_helper'

describe "issues/edit" do
  before(:each) do
    @issue = assign(:issue, stub_model(Issue,
      :description => "MyText",
      :state => "MyText",
      :urgecny => 0,
      :picture => File.new(File.join(Rails.root, 'spec', 'support', 'text-file-icon.png')),
      :attachment => File.new(File.join(Rails.root, 'spec', 'support', 'text-file-icon.png'))
    ))
  end

  it "renders the edit issue form" do
    render

    assert_select "form[action=?][method=?]", issue_path(@issue), "post" do
      assert_select "textarea#issue_description[name=?]", "issue[description]"
      assert_select "select#issue_state[name=?]", "issue[state]"
      assert_select "select#issue_urgency[name=?]", "issue[urgency]"
    end
  end
end
