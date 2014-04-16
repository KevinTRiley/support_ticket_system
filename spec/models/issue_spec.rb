require 'spec_helper'

describe Issue do
  it "Issue attributes must not be empty" do
    issue = FactoryGirl.build(:issue)

    expect(issue.description).to eq("issue description")
  end
end
