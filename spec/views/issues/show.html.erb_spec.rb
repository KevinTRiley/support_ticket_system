require 'spec_helper'

describe "issues/show" do
  before(:each) do
    @issue = assign(:issue, stub_model(Issue,
      :description => "MyText",
      :state => "MyText",
      :urgency => 0,
      :picture => File.new(File.join(Rails.root, 'spec', 'support', 'text-file-icon.png')),
      :attachment => File.new(File.join(Rails.root, 'spec', 'support', 'text-file-icon.png'))
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
  end
end
