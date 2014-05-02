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
  validates :issue_id, :note, presence: true
  validates :issue_id, uniqueness: true

end
