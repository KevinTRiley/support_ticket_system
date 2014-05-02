# == Schema Information
#
# Table name: platforms
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Platform < ActiveRecord::Base
  has_many :issues
  validates :name, presence: true

end
