require 'spec_helper'

describe "issues/show" do
  before(:each) do
    @issue = assign(:issue, stub_model(Issue,
      :description => "MyText",
      :state => "MyText",
      :urgency => 0
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
  end
end
