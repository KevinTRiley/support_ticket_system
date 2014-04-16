require 'spec_helper'

describe Issue do
  it "Issue attributes must not be empty" do
    issue = FactoryGirl.build(:issue)

    expect(issue.description).to eq("issue description")
    expect(issue.state).to eq("new")
    expect(issue.urgency).to eq(0)
  end
  it "Image is valid" do
    image = File.new("#{Rails.root}/spec/support/text-file-icon.png")
    expect(FactoryGirl.build(:issue, picture: image)).to be_valid
  end
end
