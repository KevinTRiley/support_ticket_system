# == Schema Information
#
# Table name: resolutions
#
#  id            :integer          not null, primary key
#  issue_id      :integer
#  note          :text
#  email_message :text
#  created_at    :datetime
#  updated_at    :datetime
#

class Resolution < ActiveRecord::Base
  belongs_to :issue
  validates :issue_id, presence: true
  validates :issue_id, uniqueness: true

  acts_as_taggable
  acts_as_taggable_on :resolution_tags

end
