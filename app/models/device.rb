# == Schema Information
#
# Table name: devices
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Device < ActiveRecord::Base
  has_many :issues, dependent: :destroy
  validates :name, presence: true


  def self.devices_ordered_by_most_recent_unresolved_and_resolved_issues
    unresolvedIssues = Device.all.each { |device| device.most_recent_unresolved_issue }
    resolvedIssues = Device.all.each { |device| (device.are_all_issues_resolved ? device.most_recent_resolved_issue : nil) }
    devicesWithUnresolvedIssues = unresolvedIssues.each { |issue| Device.find(issue.id) }
    devicesWithResolvedIssues = resolvedIssues.each { |issue| Device.find(issue.id) }
    return devicesWithUnresolvedIssues + devicesWithResolvedIssues
  end

  def most_recent_unresolved_issue
    issues.where("state != 'Resolved'").find(:first, :order => "created_at desc")
  end

  def most_recent_resolved_issue
    issues.where("state = 'Resolved'").find(:first, :order => "created_at desc")
  end

  def are_all_issues_resolved
    issues.where("state = 'Resolved'").count == issues.count
  end

end
