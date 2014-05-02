# == Schema Information
#
# Table name: issues
#
#  id          :integer          not null, primary key
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#  state       :string(255)
#  urgency     :integer
#  picture     :string(255)
#  attachment  :string(255)
#  email       :string(255)
#  device_id   :integer
#  platform_id :integer
#  category_id :integer
#

require 'spec_helper'

describe Issue do
  it "Issue attributes must not be empty" do
    issue = FactoryGirl.build(:issue)

    expect(issue.description).to eq("issue description")
    expect(issue.state).to eq("new")
    expect(issue.urgency).to eq(0)
  end
end
