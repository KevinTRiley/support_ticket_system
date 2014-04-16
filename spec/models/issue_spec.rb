require 'spec_helper'

describe Issue do
  it "Issue attributes must not be empty" do
    issue = FactoryGirl.build(:issue)

    expect(issue.description).to eq("issue description")
    expect(issue.state).to eq("new")
    expect(issue.urgency).to eq(0)
  end
end
