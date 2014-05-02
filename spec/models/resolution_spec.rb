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

require 'spec_helper'

describe Resolution do
  pending "add some examples to (or delete) #{__FILE__}"
end
